import pandas as pd
import re


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

    @side1.setter
    def side1(self, side1):
        self._side1 = side1

    @side2.setter
    def side2(self, side2):
        self._side2 = side2

    @side3.setter
    def side3(self, side3):
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


def show(dataframe, title):
    print('{0:-^120}'.format(title))
    print(dataframe)
    print()


class Collection:

    @staticmethod
    def tr_Size(size: str):
        reg = r'[-+]?(?:\d+(?:\.\d*)?|\.\d+)(?:[eE][-+]?\d+)?'
        m = re.findall(reg + 'M', size)
        k = re.findall(reg + 'K', size)
        if len(m): return float(m[0][:-1])
        elif len(k): return float(k[0][:-1]) / 1024
        return 10.

    @staticmethod
    def tr_Installs(number: str):
        return int(number.replace(',', '').replace('+', ''))

    @staticmethod
    def tr_Price(price: str):
        return float(price.replace('$', '')) * 64

    @staticmethod
    def tr_Android_Ver(version):
        version = str(version)
        reg = r'[-+]?(?:\d+(?:\.\d*)?|\.\d+)(?:[eE][-+]?\d+)?'
        array = re.findall(reg, version)
        if len(array) == 1: return float(array[0])
        elif len(array) == 2: return float(array[0]) + float(array[1]) * 0.1
        return 0

    @staticmethod
    def tr_Content_Rating(rating):
        rate_list = [
            ['Everyone 10+', '10'],
            ['Everyone', '0'],
            ['Teen', '16'],
            ['Mature 17+', '17'],
            ['Adults only 18+', '18'],
            ['Unrated', '0'],
        ]
        for rule in rate_list:
            rating = rating.replace(*rule)
        return int(rating)


def make_beatifull(df: pd.DataFrame):
    df['Size'] = df['Size'].apply(Collection.tr_Size)
    df['Installs'] = df['Installs'].apply(Collection.tr_Installs)
    df['Last Updated'] = pd.to_datetime(df['Last Updated'])
    df['Price'] = df['Price'].apply(Collection.tr_Price)
    df['Android Ver'] = df['Android Ver'].apply(Collection.tr_Android_Ver)
    df['Current Ver'] = df['Current Ver'].apply(Collection.tr_Android_Ver)
    df['Content Rating'] = df['Content Rating'].apply(
        Collection.tr_Content_Rating)
    df.loc[df['Rating'].isna()]=0
    df = df.rename(
        columns={
            'Unnamed: 0': 'ID like',
            'Content Rating': 'Min rating',
            'Current Ver': 'App Ver',
        })
    df = df.drop(columns='Type')     # Not need
    return df


if __name__ == '__main__':
    df = pd.read_csv('D:/WORKS/Python-Tests/PythonSchool/wild_data.csv')
    df = make_beatifull(df)
    # yapf: disable
    df4 = df.loc[df['Rating']>4.9]
    df5 = (df
            .loc[df['Category']=='GAME']
            .loc[(df['Rating']>4.9) &(df['Price']==0)]
            .drop(columns=['Price','Category'])
        )
    show(df4,'Well rating')
    show(df5,'Well rating games')
    print('\n NaNs:')
    print(df.isna().sum())
