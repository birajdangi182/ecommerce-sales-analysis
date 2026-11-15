import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv("../data/sales_data.csv", parse_dates=["order_date"])
df["month"] = df["order_date"].dt.to_period("M").astype(str)
monthly = df.groupby("month", as_index=False)["revenue"].sum()
category = df.groupby("category")["revenue"].sum().sort_values()

fig, axes = plt.subplots(1, 2, figsize=(12, 5))
axes[0].plot(monthly["month"], monthly["revenue"], marker="o")
axes[0].set_title("Monthly Revenue")
axes[0].tick_params(axis="x", rotation=45)
axes[1].barh(category.index, category.values)
axes[1].set_title("Revenue by Category")
plt.tight_layout()
plt.savefig("dashboard_preview.png", dpi=160)
plt.show()
