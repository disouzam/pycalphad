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
    ## Based on [Xarray - more than Pandas in multiple dimensions - Ondřej Grover [PyData Prague #8 2020]](https://www.youtube.com/watch?v=ww4EYv20Ucw)
    """)
    return


@app.cell
def _():
    return


if __name__ == "__main__":
    app.run()
