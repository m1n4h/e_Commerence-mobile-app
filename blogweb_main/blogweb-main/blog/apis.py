from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework.request import Request
from users.models import BlogUser
from .models import Post
from .serializers import PostSerializer


@api_view(['GET', 'POST'])
def all_posts(request: Request):
    if request.method == 'POST':
        # actions here.
        pass

    # this is used to retrieve posts per specific user.
    # user : BlogUser = request.user
    # posts      = Post.objects.filter(published = True, user = user)

    posts      = Post.objects.filter(published = True)
    serializer = PostSerializer(posts, many=True)
    return Response(serializer.data)


@api_view(['POST'])
def create_post(request: Request):

    user : BlogUser = request.user
    data = request.data

    title = data.get('title')
    minutes = data.get('minutes')
    body = data.get('body')
    published = bool(data.get('published'))

    Post.objects.create(
        title = title,
        author = user,
        minutes = minutes,
        body = body,
        published = published
    )

    context = dict()
    context['message'] = 'Post Created Successfully.'
    context['status'] = 'POST.200' # custom code for the gateway.
    return Response(context)