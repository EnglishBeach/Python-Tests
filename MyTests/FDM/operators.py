import numpy as _np
import matplotlib.pyplot as _plt


def Coordinate(x: _np.ndarray):
    min_cord = x.min()
    max_cord = x.max()
    step = x[2] - x[1]
    return _np.hstack((min_cord - step, _np.asarray(x), max_cord + step))


def set_ghost(vector, kind=2):
    if kind == 2:
        vector[0] = 3 * vector[1] - 3 * vector[2] + vector[3]
        vector[-1] = 3 * vector[-2] - 3 * vector[-3] + vector[-4]
    elif kind == 1:
        vector[0] = -2 * vector[1] + vector[2]
        vector[-1] = 2 * vector[-2] - vector[-3]
    elif kind == 0:
        vector[0] = vector[1]
        vector[-1] = vector[-2]


class _Operator:

    def __init__(self, x: _np.ndarray):
        self._step = x[2] - x[1]
        self.mat = _np.zeros(shape=(x.shape[0], x.shape[0]))
        self.mat[0, 0], self.mat[-1, -1] = 1, 1
        self._solve_positions = range(1, self.mat.shape[0] - 1)


class Laplace(_Operator):

    def __init__(self, x: _np.ndarray):
        super().__init__(x)
        for pos in self._solve_positions:
            self.mat[pos, pos - 1] = 1
            self.mat[pos, pos] = -2
            self.mat[pos, pos + 1] = 1

    def __call__(self, vector: _np.ndarray):
        return self.mat @ vector / self._step**2


class Grad(_Operator):

    def __init__(self, x: _np.ndarray):
        super().__init__(x)

        for pos in self._solve_positions:
            self.mat[pos, pos - 1] = -1
            self.mat[pos, pos + 1] = 1

    def __call__(self, vector: _np.ndarray):
        return self.mat @ vector / (2 * self._step)


def func_plot1D(
    x,
    funcs: list,
    fig=None,
    ax=None,
    with_ghost=False,
    scatter=False,
):
    if (fig or ax) is None:
        fig, ax = _plt.subplots(facecolor='White')
        fig.set_size_inches(16, 8)
    for func in funcs:

        if with_ghost:
            x_line = x
            y_line = func
        else:
            x_line = x[1:-1]
            y_line = func[1:-1]

        if scatter: ax.scatter(x_line, y_line, linewidth=1)
        else: ax.plot(x_line, y_line, linewidth=1)
    return ax
