"""
The binary module enables plotting of binary
isobaric phase diagrams.
"""
import scipy.spatial
import itertools
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
#pylint: disable=E1101
from matplotlib import collections as mc
from pycalphad import energy_surf

def binplot(db, comps, phases, x_variable, low_temp, high_temp,
            steps=None, **kwargs):
    """
    Calculate the binary isobaric phase diagram for the given temperature
    range.
    """
    assert high_temp > low_temp
    minimum_distance = 0.001
    tie_lines = []
    tie_line_colors = []
    tie_line_widths = []
    tsteps = steps or int((high_temp-low_temp) / 10) # Take 10 K steps by def.
    temps = list(np.linspace(low_temp, high_temp, num=tsteps))

    ppp = 100 # points per phase
    if 'points_per_phase' not in kwargs:
        kwargs['points_per_phase'] = ppp

    # Calculate energy surface at each temperature
    full_df, nrg = energy_surf(db, comps, phases, T=temps, **kwargs)

    for temp in temps:

        # Select only the P, T, etc., of interest
        point_selector = (full_df['T'] == temp)
        hull_frame = full_df.ix[point_selector]
        #print(hull_frame)
        #point_frame = hull_frame[[x_variable]]
        # Calculate the convex hull for the desired points
        hull_points = hull_frame[[x_variable, 'GM']].values
        np.clip(hull_points, -1e10, 1e10, out=hull_points)
        hull = scipy.spatial.ConvexHull(
            hull_points
        )
        # keep track of tie line orientations
        # this is for invariant reaction detection
        tieline_normals = []
        current_tielines = []

        # this was factored out of the loop based on profiling
        #coordinates = point_frame.values[hull.simplices]

        for simplex, equ in \
            zip(hull.simplices, hull.equations):
            if equ[-2] > -1e-6:
                # simplex oriented 'upwards' in energy direction
                # must not be part of the energy surface
                continue
            #distances = scipy.spatial.distance.pdist(coords)
            simplex_edges = \
                np.asarray(list(itertools.combinations(simplex, 2)))
            #phase_edge_list = hull_frame['Phase'].values[simplex_edges]
            #edge_phases_match = \
            #    np.array(phase_edge_list[:, 0] == phase_edge_list[:, 1])
            new_lines = simplex_edges
            # Check if this is a two phase region
            first_endpoint = hull_frame.iloc[new_lines[0][0]]
            second_endpoint = hull_frame.iloc[new_lines[0][1]]
            phases_match = first_endpoint.ix['Phase'] == \
                second_endpoint.ix['Phase']

            if phases_match:
                # Is this a miscibility gap region?
                # Check that the average of the tieline energy is less than
                # the energy calculated at the midpoint
                # If not, this is a single-phase region and should be dropped
                phase_name = first_endpoint.ix['Phase']
                input_cols = [x for x in hull_frame.columns if phase_name in x]
                #midpoint = np.mean([first_endpoint.ix[input_cols].values, \
                #    second_endpoint.ix[input_cols].values], axis=0)
                # chebyshev distance returns maximum difference between any
                # dimension
                #pxd = scipy.spatial.distance.chebyshev(
                #    first_endpoint.ix[input_cols].values, \
                #    second_endpoint.ix[input_cols].values)
                pxd = scipy.spatial.distance.chebyshev(
                    first_endpoint.ix[x_variable], \
                    second_endpoint.ix[x_variable])
                if (pxd < 0.05):
                    continue
                # energy at midpoint
                #midpoint_nrg = nrg[phase_name](*midpoint)
                # average energy of endpoints
                #average_nrg = (0.5 * (first_endpoint.ix['GM'] + \
                #    second_endpoint.ix['GM']))
                #if average_nrg >= midpoint_nrg:
                #    # not a true tieline, drop this simplex
                #    continue
            # if we get here, this is a miscibility gap region or a
            # two-phase region
            current_tielines.append(
                [[first_endpoint.ix[x_variable], temp, first_endpoint.ix['Phase']], \
                    [second_endpoint.ix[x_variable], temp, second_endpoint.ix['Phase']]]
                    )
            tieline_norm = equ[:-1]
            tieline_normals.append(tieline_norm)

            # enumerate all normals but the one we just added
            for idx, normal in enumerate(tieline_normals[:-1]):
                continue
                dihedral = np.dot(normal, tieline_norm)
                if dihedral > (1.0 - 1e-11):
                    # nearly coplanar: we are near a 3-phase boundary
                    # red for an invariant
                    tie_lines.append(current_tielines[-1])
                    tie_lines.append(current_tielines[idx])
                    # prevent double counting
                    #del current_tielines[idx]
                    #del current_tielines[-1]
                    tie_line_colors.append([1, 0, 0, 1])
                    tie_line_widths.append(2)
                    tie_line_colors.append([1, 0, 0, 1])
                    tie_line_widths.append(2)

            for line in current_tielines:
                # Green for a tie line
                tie_lines.append(line)
                tie_line_colors.append([0, 1, 0, 1])
                tie_line_widths.append(0.5)

    tie_lines = np.asarray(tie_lines)
    #print(tie_lines)
    # Final plotting setup
    colorlist = {}

    # colors from Junwei Huang, March 21 2013
    # exclude green and red because of their special meaning on the diagram
    ColorValues=["0000FF", "FFFF00", "FF00FF", "00FFFF", "000000", 
            "800000", "008000", "000080", "808000", "800080", "008080", "808080", 
            "C00000", "00C000", "0000C0", "C0C000", "C000C0", "00C0C0", "C0C0C0", 
            "400000", "004000", "000040", "404000", "400040", "004040", "404040", 
            "200000", "002000", "000020", "202000", "200020", "002020", "202020", 
            "600000", "006000", "000060", "606000", "600060", "006060", "606060", 
            "A00000", "00A000", "0000A0", "A0A000", "A000A0", "00A0A0", "A0A0A0", 
            "E00000", "00E000", "0000E0", "E0E000", "E000E0", "00E0E0", "E0E0E0"]
    M=len(ColorValues)
    
    phasecount = 0
    legend_handles = []
    for phase in phases:
        colorlist[phase] = "#"+ColorValues[np.mod(phasecount,M)]
        legend_handles.append(mpatches.Patch(color=colorlist[phase], label=phase))
        phasecount = phasecount + 1
    
    # Get the configured plot colors
    plotcolors = list(map(lambda x: [colorlist[x[0]], colorlist[x[1]]], tie_lines[:, :, 2]))
    fig = plt.figure(dpi=600, figsize=(8, 6))
    ax = fig.gca()
    ax.tick_params(axis='both', which='major', labelsize=14)
    ax.grid(True)

    # position the phase legend
    box = ax.get_position()
    ax.set_position([box.x0, box.y0, box.width * 0.8, box.height])
    ax.legend(handles=legend_handles, loc='center left', bbox_to_anchor=(1, 0.5))

    plt.xlim([0, 1])
    plt.ylim([low_temp, high_temp])

    if len(tie_lines) > 0:
        lc = mc.LineCollection(
            tie_lines[:, :, 0:2], color=tie_line_colors, linewidth=tie_line_widths, zorder=1
        )
        ax.add_collection(lc)
        ax.scatter(tie_lines[:, :, 0].ravel(), tie_lines[:, :, 1].ravel(), color=np.asarray(plotcolors).ravel(), s=3, zorder=2)

    plot_title = '-'.join([x.title() for x in sorted(comps) if x != 'VA'])
    plt.title(plot_title, fontsize=20)
    ax.set_xlabel(x_variable, labelpad=15, fontsize=20)
    ax.set_ylabel("Temperature (K)", fontsize=20)
    plt.show()
