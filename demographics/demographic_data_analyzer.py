import pandas as pd


def calculate_demographic_data(print_data=True):
    # Read data from file
    df = pd.read_csv('adult.data.csv')

    # How many of each race are represented in this dataset? This should be a Pandas series with race names as the index labels.
    race_count = df['race'].value_counts()

    # What is the average age of men?
    average_age_men = float((df[df["sex"] == "Male"]["age"].mean()).round(decimals=1))

    # What is the percentage of people who have a Bachelor's degree?
    vc = df['education'].value_counts(normalize=True)
    percentage_bachelors = round(float(vc['Bachelors'] * 100), 1)

    # What percentage of people with advanced education (`Bachelors`, `Masters`, or `Doctorate`) make more than 50K?
    # What percentage of people without advanced education make more than 50K?

    # with and without `Bachelors`, `Masters`, or `Doctorate`
    advanced_degrees = ["Bachelors", "Masters", "Doctorate"]
    filtered_df = df[df["education"].isin(advanced_degrees)]
    total_count = len(filtered_df)
    high_earners = filtered_df[filtered_df["salary"] == ">50K"]
    he_count = len(high_earners)
    higher_education = float((he_count / total_count * 100))
    advanced_degrees = ["Bachelors", "Masters", "Doctorate"]
    filtered_df_2 = df[~df["education"].isin(advanced_degrees)]
    total_count = len(filtered_df_2)
    high_earners = filtered_df_2[filtered_df_2["salary"] == ">50K"]
    he_count = len(high_earners)    
    lower_education = float(he_count / total_count * 100)

    # percentage with salary >50K
    higher_education_rich = round(higher_education, 1)
    lower_education_rich = round(lower_education, 1)

    # What is the minimum number of hours a person works per week (hours-per-week feature)?
    min_work_hours = df["hours-per-week"].min()

    # What percentage of the people who work the minimum number of hours per week have a salary of >50K?
    mdf = df[df["hours-per-week"] == 1]
    total_count = len(mdf)
    high_earners = mdf[mdf["salary"] == ">50K"]
    he_count = len(high_earners)
    num_min_workers = float(he_count / total_count * 100)

    rich_percentage = float(he_count / total_count * 100)

    # What country has the highest percentage of people that earn >50K?
    he = df[df["salary"] == ">50K"]
    country_stats = he.groupby("native-country").agg(n=("salary", "count"))
    country_stats_total = df.groupby("native-country").agg(t=("salary", "count"))
    country_stats["percentage_high_earners"] = (
        country_stats["n"] / country_stats_total["t"] * 100
    )
    highest_earning_country = country_stats["percentage_high_earners"].idxmax()
    highest_earning_country_percentage = round(country_stats["percentage_high_earners"].max(), 1)

    # Identify the most popular occupation for those who earn >50K in India.
    ihe = df[(df["salary"] == ">50K") & (df["native-country"] == 'India')]
    top_IN_occupation = ihe['occupation'].value_counts().idxmax()

    # DO NOT MODIFY BELOW THIS LINE

    if print_data:
        print("Number of each race:\n", race_count) 
        print("Average age of men:", average_age_men)
        print(f"Percentage with Bachelors degrees: {percentage_bachelors}%")
        print(f"Percentage with higher education that earn >50K: {higher_education_rich}%")
        print(f"Percentage without higher education that earn >50K: {lower_education_rich}%")
        print(f"Min work time: {min_work_hours} hours/week")
        print(f"Percentage of rich among those who work fewest hours: {rich_percentage}%")
        print("Country with highest percentage of rich:", highest_earning_country)
        print(f"Highest percentage of rich people in country: {highest_earning_country_percentage}%")
        print("Top occupations in India:", top_IN_occupation)

    return {
        'race_count': race_count,
        'average_age_men': average_age_men,
        'percentage_bachelors': percentage_bachelors,
        'higher_education_rich': higher_education_rich,
        'lower_education_rich': lower_education_rich,
        'min_work_hours': min_work_hours,
        'rich_percentage': rich_percentage,
        'highest_earning_country': highest_earning_country,
        'highest_earning_country_percentage':
        highest_earning_country_percentage,
        'top_IN_occupation': top_IN_occupation
    }
