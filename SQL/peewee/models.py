import peewee as pe

database = pe.MySQLDatabase(
    'orm2',
    user='root',
    password='',
)


class BaseModel(pe.Model):

    class Meta:
        database = database


class Category(BaseModel):

    # class Meta:
    #     table_name = 'Categories'

    name = pe.CharField(30, unique=True)
    description = pe.CharField(100)


class Product(BaseModel):
    name = pe.CharField(25)
    price = pe.FloatField(default=None)
    category = pe.ForeignKeyField(
        Category,
        related_name='fk_category',
        on_delete='cascade',
        on_update='cascade',
    )
    inserted_at = pe.DateTimeField(default=pe.datetime.datetime.now)


if __name__ == '__main__':
    with database:
        database.drop_tables([Category, Product],safe=False)
        database.create_tables([Category, Product])
