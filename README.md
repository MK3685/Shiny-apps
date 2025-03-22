# Shiny Income & Demographics Explorer  

## 📌 Overview  
This is a **Shiny web application** that explores trends in **demographics and income levels** using the **UCI Adult Income dataset**. The app allows users to filter by country and analyze differences between individuals earning **less than 50K** and **more than 50K** per year.  

🔗 **Live App:** [Shiny Income & Demographics Explorer](https://korirtheanalyst.shinyapps.io/shinny/)  

---

## 🚀 Features  
✔️ **Filter by Country** – Select a country to focus the analysis.  
✔️ **Continuous Variable Analysis** – Explore trends in age and work hours using histograms and boxplots.  
✔️ **Categorical Variable Analysis** – Compare education, work class, and gender distributions with bar charts.  
✔️ **Dynamic Graphs** – Interactive plots powered by `ggplot2`.  

---

## 📂 Dataset  
The dataset comes from the **UCI Machine Learning Repository** and includes demographic and income data.  

📌 **Source:** [UCI Adult Dataset](https://archive.ics.uci.edu/ml/datasets/adult)  

### Columns Used:  
- `age`, `education`, `workclass`, `sex`, `hours_per_week`, `native_country`, `prediction` (income level)  

---

## 💻 Installation & Running Locally  
To run the app on your local machine:  

1️⃣ **Clone the Repository**  
```sh
git clone https://github.com/MK3685/shinny-project.git
cd shinny-project
