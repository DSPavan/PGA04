#!C:\python27\python
from pyvttbl import DataFrame

datafile="C:\\Users\\radhapavan\\Desktop\\Alex\\anova.csv"
df=DataFrame()
df.read_tbl(datafile)
aov_pyvttbl = df.anova1way('deal_probability', 'parent_category_name')
print aov_pyvttbl


