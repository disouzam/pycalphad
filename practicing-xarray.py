import marimo

__generated_with = "0.23.4"
app = marimo.App(width="full")


@app.cell
def _():
    import marimo as mo

    return (mo,)


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    **Reference:**

    Based on [Xarray - more than Pandas in multiple dimensions - Ondřej Grover [PyData Prague #8 2020]](https://www.youtube.com/watch?v=ww4EYv20Ucw)
    """)
    return


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    # Numpy array manipulation
    """)
    return


@app.cell
def _():
    import numpy as np

    x = np.linspace(0, 5)
    y = x**2

    print(x)
    print(len(x))

    def sum(w, h):
        return w * 2 + h * 2

    def sum2(*, csx, h):
        return csx * 2 + h

    # Primitive obsession

    a = sum(3, 4)
    b = sum(w=3, h=15)
    c = sum(h=15, w=3)
    c2 = sum(15, 3)

    e = sum2(w=3, h=15)
    f = sum2(h=15, w=3)
    d = sum2(3, 4)

    return np, x, y


@app.cell
def _(y):
    print(y)
    return


@app.cell
def _(x, y):
    y_sel = y[(2 < x) & (x < 3)]
    y_sel
    return


@app.cell
def _(x, y):
    y_sel2 = y[x < 0.20]
    print(y_sel2)
    return


@app.cell
def _(x):
    x_sel = x < 0.20
    print(x_sel)
    return


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    # Pandas series manipulation
    """)
    return


@app.cell
def _(x, y):
    import pandas as pd

    ys = pd.Series(y, index=x)
    ys
    return (ys,)


@app.cell
def _(ys):
    ys.loc[2:3]
    return


@app.cell
def _(ys):
    ys.iloc[2:4]
    return


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    # Algebraic dimensions in NumPy
    """)
    return


@app.cell
def _(np):
    A = np.random.rand(5, 7, 3)
    print(A)
    return (A,)


@app.cell
def _(A):
    print(A.shape)
    return


@app.cell
def _(A):
    B = A.T.swapaxes(2, 1)
    B
    return (B,)


@app.cell
def _(B):
    print(B.shape)
    return


@app.cell
def _(B, np):
    x_mean = np.mean(B, axis=2)
    print(x_mean)
    print(x_mean.shape)
    return


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ## Broadcasting
    """)
    return


@app.cell
def _(B, np):
    t = np.linspace(0, 1, 5)
    C = B * np.exp(-t).reshape((-1, 1))
    C.shape
    return C, t


@app.cell
def _(C):
    C
    return


@app.cell
def _(t):
    t
    return


@app.cell
def _(t):
    print(t.shape)
    return


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    # Initial examples of xarray
    """)
    return


@app.cell
def _(np):
    import xarray as xr

    print(xr.__version__)

    data = np.random.rand(2, 2, 2)
    data
    return data, xr


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ## Variable
    """)
    return


@app.cell
def _(data, xr):
    dvar = xr.Variable(
        ("t", "x", "y"), data, attrs={"Simulation": "random Normal"}, encoding={}
    )
    return (dvar,)


@app.cell
def _(dvar):
    dvar
    return


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ## DataArray
    """)
    return


@app.cell
def _(np, xr):
    data_2 = np.random.rand(2, 2, 3)
    darr = xr.DataArray(
        data_2,
        dims=("t", "x", "y"),
        name="smth",
        coords={"t": [0.2, 0.3], "x": np.arange(2)},
        attrs={"simulation": "random N(0,1)"},
    )
    darr
    return (darr,)


@app.cell
def _(darr):
    darr.coords["t"]
    return


@app.cell
def _(darr):
    darr.coords["x"]
    return


@app.cell
def _(darr):
    darr.coords["y"]
    return


@app.cell
def _(darr):
    print(darr.coords)
    for coord in darr.coords:
        print(darr.coords[coord])
        # if coord.name in darr.dims and coord.ndim == 1:
        # darr.indexes[coord.name] = pd.Index(coord)
    return


if __name__ == "__main__":
    app.run()
