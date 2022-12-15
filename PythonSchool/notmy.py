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


URL = "https://web.stanford.edu/class/archive/cs/cs109/cs109.1166/stuff/titanic.csv"
import pandas as pd
df = pd.read_csv(URL)

print('Cleared:')
df2 = df.drop(columns=['Sex','Pclass','Siblings/Spouses Aboard','Parents/Children Aboard','Fare'])
print(df2)
print('Age >18:')
print(df2.loc[df['Age'] > 18])

print('Survived')
print(df2.loc[(df2['Age'] > 18) & (df['Survived']==1)].drop(columns=['Survived']))