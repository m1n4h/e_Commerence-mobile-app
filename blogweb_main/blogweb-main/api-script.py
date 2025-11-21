import requests


# r = requests.get(
#     url = 'http://127.0.0.1:8000/api/blog/posts/',
#     headers={
#         'Authorization':'Token cd9d09ea0b72e9425ab5eafbaa7de0cf5cacee6b'
#     }
# )

r = requests.post(
    url = 'http://127.0.0.1:8000/api/blog/post/create/',
    headers={
        'Authorization':'Token 04ec565428d437a3d4703af171c828dae1822a30'
    },
    json = {
        'title':'R LANGUAGE',
        'published': True,
        'minutes': 5,
        'body':'This R programming course introduces you to one of the most powerful languages for data analysis, statistics, and visualization. By studying R, you’ll learn how to clean, analyze, and interpret data efficiently while creating clear, insightful visualizations to support decision-making. R is widely used in research, finance, healthcare, and data science, making it an essential skill for anyone looking to build a career in data-driven fields.'
    }
)

print(r.status_code)

print(r.json())
