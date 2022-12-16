import pandas as pd

class Figure:

    def __init__(self, one, two, three):
        self.one = one
        self.two = two
        self.three = three


class Triangle(Figure):

    def get_perimetr(self):
        return self.one + self.two + self.three

    def eval_square(self):
        polu_per = (self.one + self.two + self.three) / 2
        return (polu_per * (polu_per - self.one) * (polu_per - self.two) * (polu_per - self.three))**(1 / 2)



df = pd.read_csv('D:/WORKS/Python-Tests/PythonSchool/wild_data.csv')

def size_f(size: str):
    if size == 'Varies with device': return 0.
    elif size.find('M') >= 0: return float(size.replace('M', ''))*1024
    elif size.find('K') >= 0: return float(size.replace('K', ''))

def tr_Content_Rating(rating):
    rating =rating.replace('Everyone 10+','10').replace('Everyone','0').replace('Teen','16').replace('Mature 17+','17').replace('Adults only 18+', '18').replace('Unrated','0')

    if rating == 'NaN': return 0
    return int(rating)

df['Size'] = df['Size'].apply(size_f)
df['Installs'] = df['Installs'].apply(
    lambda x: int(x.replace(',', '').replace('+', ''))
    )
df['Last Updated'] = pd.to_datetime(df['Last Updated'])
df['Price'] = df['Price'].apply(lambda x: float(x.replace('$', '')))
df['Content Rating'] = df['Content Rating'].apply(tr_Content_Rating)
df.loc[df['Rating'].isna()]=0

df4 = df.loc[df['Rating']>4.9]
df5 =df.loc[df['Category']=='GAME'].loc[(df['Rating']>4.9) &(df['Price']==0)].drop(columns=['Price','Category'])

print('Cleared:')
print(df)

print('Rating >4.9 :')
print(df4)

print('Rating >4.9 Games')
print(df5)