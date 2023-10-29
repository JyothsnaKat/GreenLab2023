data <- read.csv("D:/Green lab/ProcessedReq2.csv")
print(data)

# This is to check for Energy consumed against application name
kruskal.test(Energy_consumed ~ Application_name, data=data)

# This is to check for Energy consumed against Domain name
kruskal.test(Energy_consumed ~ Domain_name, data=data)