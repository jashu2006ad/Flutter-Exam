import pandas as pd
import numpy as np

from sklearn.model_selection import train_test_split
from sklearn.naive_bayes import GaussianNB
from sklearn.metrics import accuracy_score
from sklearn.metrics import confusion_matrix

# Load the dataset
dataset = pd.read_csv("Iris.csv")

# Select input features
X = dataset.iloc[:, :4].values

# Select target labels
Y = dataset["Species"].values

# Split the dataset
X_train, X_test, Y_train, Y_test = train_test_split(
    X, Y, test_size=0.3, random_state=42
)

# Create the classifier
classifier = GaussianNB()

# Train the model
classifier.fit(X_train, Y_train)

# Display the first test sample
print(X_test[0])

# Predict the species
y_pred = classifier.predict(X_test)
print(y_pred)

# Calculate accuracy
accuracy = accuracy_score(Y_test, y_pred)
print("Accuracy:", accuracy)

# Display the confusion matrix
print(confusion_matrix(Y_test, y_pred))
