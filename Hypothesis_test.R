data <- read.csv("D:/MS VU/Green lab/GreenLab2023/final.csv")
print(data)

# This is to check for Energy consumed against Domain name
kruskal.test(EC ~ Domain, data=data)

# This is to check for Energy consumed against application name
kruskal.test(EC ~ Application, data=data)
