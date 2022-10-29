rm(list = ls()) 
a = c(1,2,3) # create
class(a)

# 当你又有数字又有字符，那你的变量就全变成字符了
a = c(1,2,"a")
class(a)

# 当然一个一个创造确实有点呆
a = 1:10
a = seq(1,10)
class(a)

# LETTERS:26个大写字母
a = LETTERS[11]
class(a)
substring(a)

# 双引号和单引号没有太大区别，但是只有
# 我们需要将单引号当做字符时才需要用到
a = "yangyang's"
class(a)


# 我们给向量加上维度,先沿着axis=0
a = seq(1,10)
dim(a) = c(2,5)
class(a)
# View(a)
pheatmap::pheatmap(a)
a[1,3] = 'a'
class(a)
str(a)

# 数据框is and as,此时再更改其中元素属性，
# 会和excel一样
# 更改对应列的元素属性，也就是axis=0
is.data.frame(a)
as.data.frame(a)

# xx$mm  dollar character:查看xx的某个元素mm
options()$repos
options()$BioC_mirror
a = options()
class(a)
a = options()$repos
class(a)
mode(a)
typeof(a)

a = 1:10
dim(a) = c(2,5)
a[,1]
a[,c(T,F)]
a[,c(F,F,F,F,T)]


rivers
head(rivers) # 全部6个观测值
tail(rivers) # 后6个观测值
names(rivers) # 显示变量名
rivers    #北美141条河流长度
