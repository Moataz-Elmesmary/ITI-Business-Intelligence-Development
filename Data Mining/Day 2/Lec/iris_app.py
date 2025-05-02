import streamlit as st 
import pandas as pd
import numpy as np
import joblib 


st.title("Iris Flower Species Predictions")
st.write("This simple app uses a saved naive bayes nodel to predict Iris flower species")

iris_df = pd.read_csv("iris.csv")

st.subheader("📊Show Dataset Preview")
st.write(iris_df.head())


st.sidebar.header("Input Flower Features")

sepal_length = st.sidebar.slider("Sepal Length (cm)",
                   iris_df['sepal length (cm)'].min(),
                   iris_df['sepal length (cm)'].max(),
                   iris_df['sepal length (cm)'].mean()
                   )


sepal_width  = st.sidebar.slider("sepal width",
iris_df['sepal width (cm)'].min(),
iris_df['sepal width (cm)'].max(),
iris_df['sepal width (cm)'].mean())

petal_width  = st.sidebar.slider("petal width (cm)",
iris_df['petal width (cm)'].min(),
iris_df['petal width (cm)'].max(),
iris_df['petal width (cm)'].mean())

petal_length  = st.sidebar.slider("petal length (cm)",
iris_df['petal length (cm)'].min(),
iris_df['petal length (cm)'].max(),
iris_df['petal length (cm)'].mean())

input_data = np.array([[sepal_length,sepal_width,petal_width,petal_length]])

model = joblib.load('NaiveBayesModel.pkl')
prediction = model.predict(input_data)[0]

pred_proba = model.predict_proba(input_data)[0]
species_labels = {
    0: 'setosa',
    1: 'versicolor',
    2: 'virginica'
}
# # Show prediction
st.subheader("🔮 Prediction Result")
st.write(f"**Predicted Species:** {species_labels[prediction]}")



# # Show prediction probabilities
st.subheader("📈 Prediction Probabilities")
st.write(f"Setosa: {pred_proba[0]:.2%}")
st.write(f"Versicolor: {pred_proba[1]:.2%}")
st.write(f"Virginica: {pred_proba[2]:.2%}")
