
load("GeneExpressionData.RData")
ls()
table(class.labels)
exp.matrix <- exp.matrix[, c(which(class.labels=="normal"), which(class.labels=="clearcellRCC"))]

# Finding principal components require calculating the variance 
# command 'prcomp' will return an error if any feature (gene) has 
# zero variance (or standard deviation). Checking for and discarding 
# such features is recommended 
std <- apply(exp.matrix, 1, sd)
if(any(std < 0.001))
	{
	ind <- which(std < 0.001)
	mat2 <- exp.matrix[-ind,] 
	}
pca <- prcomp(t(exp.matrix), scale=T)
names(pca)
a <- pca$sdev
pc1 <- a[1]^2/sum(a^2)
pc2 <- a[2]^2/sum(a^2)
pc3 <- a[3]^2/sum(a^2)
colors <- ifelse(class.labels=="normal", "green", "red")
symbols <- ifelse(class.labels=="normal", 16, 17)

plot(pca$x[,1:2], pch=symbols, cex=1.5, col=colors, main="2D PCA plot",
xlab=paste("PC1 (", round(100*pc1, 2), "%)", sep=""), 
ylab=paste("PC2 (", round(100*pc2, 2), "%)", sep=""))
legend("topright", legend=c("Normal","ClearCellRCC"), col=c("green","red"),
pch=c(16,17), pt.cex=1.5)


# variance explained by principal components
pos <- barplot((a^2/sum(a^2)), plot=FALSE, main="% Variance explained by principal components", xlab="Principal Components", ylab="% Variance Explained", names.arg=paste("PC", c(1:45), sep=""))
barplot(a^2/sum(a^2), axes=FALSE, main="% Variance explained by principal components", xlab="Principal Components", ylab="% Variance Explained")
axis(side=1, las=2, at=pos, labels=paste("PC", c(1:45), sep=""), cex.axis=0.7)
axis(side=2, las=1, at=seq(0, max(a^2/sum(a^2)), by=0.05), cex.axis=1)

sessionInfo()
