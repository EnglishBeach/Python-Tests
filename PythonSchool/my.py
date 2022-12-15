class Figure:

    def __init__(self, side1, side2, side3, name=None):
        self._side1 = side1
        self._side2 = side2
        self._side3 = side3
        self._name = name

    @property
    def side1(self):
        return self._side1

    @property
    def side2(self):
        return self._side2

    @property
    def side3(self):
        return self._side3

    @property
    def name(self):
        return self._name

    def set_side1(self, side1):
        self._side1 = side1

    def set_side2(self, side2):
        self._side2 = side2

    def set_side3(self, side3):
        self._side3 = side3

    def print_sides(self):
        print('Sides:')
        print('{0:_>10.2f}\n{1:_>10.2f}\n{2:_>10.2f}\n'.format(
            self._side1, self._side3, self._side3))


class Triangle(Figure):

    def eval_perimetr(self):
        return sum([self.side1, self.side2, self.side3])

    def eval_square(self):
        p = self.eval_perimetr() / 2
        a = (p - self.side1)
        b = (p - self.side2)
        c = (p - self.side3)
        return (p * a * c * b)**(1 / 2)


import pandas as pd

URL = "https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-states.csv"
df = pd.read_csv(URL)


def show(dataframe, title='',to_console=True,):
    if not to_console:
        styler = (dataframe
                  .style
                  .format(lambda x: '{0:,}'.format(x).replace(',', ' '))
                  ) #yapf: disable
        return styler
    print('{0:-^60}'.format(title))
    print(dataframe)
    print()


df2 = (df
       .loc[df['date'] == '2022-12-13']
       .groupby(['state'])
       [['cases', 'deaths']].sum()
       .sort_values('deaths', ascending=False)
       ) #yapf: disable

df3 = df2.loc[df2['deaths'] < 1000]
df4 = df2.loc[(df2['deaths'] % 2 == 1) & (df2['cases'] % 2 == 0)]

show(df.drop(columns=['date', 'fips']),'Droped')
show(df2,'Deaths of states on 2022-12-13')
show(df3,'Deaths<1000 on 2022-12-13')
show(df4,'Even Deaths and odd Cases on 2022-12-13')