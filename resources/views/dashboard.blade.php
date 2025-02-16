@extends('templates.header')

@section('dashboard')
<nav class="navbar-custom">
    <div class="container-8">
      <div class="row align-items-center g-0">
        <!-- Brand -->
        <div class="col-12 col-md-3 text-center text-md-start">
          <a href="#" class="navbar-brand">Small facebook</a>
        </div>

        <!-- Search Bar -->
        <div class="col-12 col-md-5 my-2 my-md-0">
          <input id="search-input" type="text" class="form-control search-bar px-4" placeholder="Search for creators, inspirations, and projects">
        </div>

        <!-- Create Button -->
        <div class="col-6 col-md-3 text-end">
            <form method="POST" action="{{ route('logout') }}" style="display: inline;">
                @csrf
                <button type="submit" class="btn create-button px-5">Logout</button>
            </form>
          {{-- <button class="btn create-button px-5">Logout</button> --}}
        </div>

        <!-- Profile Image -->
        <div class="col-6 col-md-1 text-center">
          <img src="@if($userimage!= null){{asset('storage/' .$userimage)}}@endif"  alt="Profile Picture" class="profile-img">
        </div>
      </div>
    </div>
</nav>
{{-- serach container  --}}
<div class=" serachContainer bg-color-1 container-8 w-25 text-start text-light mt-3 position-absolute" id="results-container">

</div>
<main>
    <div class="container-8 mt-3">
        <div style="gutter:2rem;" class="row">
            {{-- first section as nav  --}}
            <div class="col-0 col-md-2">
                {{-- profile name and photo --}}
                <div class="row g-0 bg-color-1 border b-round-4 border-0 al-i-c py-1">
                    <div class="col-4 col-md-3 text-center">
                        <img class="profile-img" src="@if($userimage!= null){{asset('storage/' .$userimage)}}@endif" alt="profile-img">
                    </div>
                    <div class="col-8 col-md-9 row">
                        <p class="mb-0 text-light f-bold">{{$userName}}</p>
                        <p class="mb-0 text-light">{{$userEmail}}</p>
                    </div>


                </div>
                {{-- nav --}}
                <div class="bg-color-1 mt-3 border border-0 b-round-4 py-3">
                    <ul class="list-d-n px-1 mb-0">
                        <li class="px-3 text-start pb-3">
                            <img style="width:30px;height:30px;" src="{{asset('storage/siteimages/home.png')}}" alt="home" class="rounded-circle d-inline me-3">
                            <p class="d-inline f-bold text-light mb-0 c-p">Home</p>
                        </li>
                        <li class="px-3 text-start pb-3">
                            <img style="width:30px;height:30px;" src="{{asset('storage/siteimages/information.png')}}" alt="info" class="rounded-circle d-inline me-3">
                            <p class="d-inline f-bold text-light mb-0 c-p">Abou us</p>
                        </li>
                        <li class="px-3 text-start pb-3">
                            <img style="width:30px;height:30px;" src="{{asset('storage/siteimages/phone.png')}}" alt="contact" class="rounded-circle d-inline me-3">
                            <p class="d-inline f-bold text-light mb-0 c-p">Contact</p>
                        </li>
                        <li class="px-3 text-start pb-3">
                            <img style="width:30px;height:30px;" src="{{asset('storage/siteimages/Support.png')}}" alt="support" class="rounded-circle d-inline me-3">
                            <p class="d-inline f-bold text-light mb-0 c-p">Support</p>
                        </li>
                        <li class="px-3 text-start">
                            <img style="width:30px;height:30px;" src="{{asset('storage/siteimages/help.png')}}" alt="help" class="rounded-circle d-inline me-3">
                            <p class="d-inline f-bold text-light mb-0 c-p">FAQ</p>
                        </li>
                    </ul>
                </div>
                {{-- buttom --}}
                <div class="mt-3 bg-color-1 border border-0 b-round-4 row g-0 al-i-c j-c-c py-2 bg-color-2"> 
                    <a href="#" class="text-center text-light td-n f-bold goToProfile">Profile</a>
                </div>
            </div>
            {{-- main  --}}
            <div class="col-0 col-md-7">
                {{-- create post --}}
                <div class="mb-3">
                    <div class="bg-color-1 row g-0 py-1 b-round-4 border border-0 px-4 al-i-c">
                        <div class="col-1 text-center">
                            <img src="@if($userimage!= null){{asset('storage/' .$userimage)}}@endif" alt="profile-img" class="profile-img-creatPost">
                        </div>
                        <form action="{{route("post.store")}}" method="POST" class="col-11 row g-0 al-i-c" enctype="multipart/form-data">
                            @csrf
                            <div class="col-11 pe-3">
                                <input type="text" name="title" placeholder='Title "optional"' class="d-inline outline-n col-10 bg-none border-n text-light w-100">
                                <textarea id="autoExpand" type="text" name="content" placeholder="What's in your mind, name ?" 
                                class="d-inline outline-n col-10 bg-none border-n text-light w-100"></textarea>                            
                                <input type="file" name="image" placeholder="What's in your mind , name ?" class="d-inline col-10 bg-none border-n text-light w-100">
                            </div>
                            <div class="col-1 row g-0 j-c-c">
                                <button class="bg-color-2 b-round-4 border border-0 px-3 text-light f-bold">Post</button>
                            </div>
                        </form>
                    </div>
                </div>
                {{-- posts  --}}
                <div>
                    @foreach($posts as $post)
                    <div class="bg-color-1 b-round-4 border border-0 mb-3 py-3">
                        <div>
                            {{-- name and photo and date  --}}
                            <div class="row g-0 al-i-c py-3" style="position: relative">
                                <div id="postOptions" class="bg-dark col-4 col-md-2 d-none" style="position: absolute ; top:0% ; left:100% ; translate: -112% 15%" id="postOptionsList">
                                    <p class="my-3 px-2 text-light c-p sendPostButton">send</p>
                                    @if($post->user_id == auth()->id())
                                    <p class="my-3 px-2 text-light c-p editePostButton">edite</p>
                                    <p class="my-3 px-2 text-light c-p deletePostButton" data-request-id="{{$post->id}}">delete</p>
                                    @endif
                                </div>
                                <div class="col-3 col-md-1 row j-c-c">
                                    <img src="@if($post->profile_picture!= null){{asset('storage/' .$post->profile_picture)}}@endif" alt="profile_picture" class="profile-img-creatPost p-0">
                                </div>
                                <div class="col-8 col-md-10">
                                    <p class="mb-0 f-bold text-light">{{$post->name}}</p>
                                    <p class="mb-0 text-light">{{$post->created_at_date_only}}</p>
                                </div>
                                <div class="row g-0 al-i-s j-c-e col-1 col-md-1">
                                    <p style="font-size: 30px; position: relative; top:-15px" class="text-light col-3 m-0 p-0 c-p" id="postOptionsButton">...</p>
                                </div>
                            </div>
                            {{-- content  --}}
                            <div class="px-4">
                                <p class="text-light f-bold">{{$post->title	}}</p>
                                <p class="text-light">{{$post->content}}</p>
                            </div>
                            {{-- photo  --}}
                            <div class="px-4">
                                <img src="@if ($post->image!=null){{asset('storage/' . $post->image)}}@endif" alt="" class="col-12 b-round-4 border border-0">
                            </div>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
            {{-- freinds - freinds request - request sent  --}}
            <div class="col-0 col-md-3">
                {{-- freinds request  --}}
                <div class="bg-color-1 border border-0 b-round-4 px-2 pb-1 pt-1">
                    <h5 class="f-bold text-light mt-1 mb-1">Freind Request</h5>
                    @foreach($friendsRequest as $friendsRequest_)
                    <div>
                        <div class="row g-0 al-i-c mb-3">
                            <div class="col-2">
                                <img src="@if($friendsRequest_['profile_picture']!= null){{asset('storage/' .$friendsRequest_['profile_picture'])}}@endif" alt="profile_picture" class="profile-img-creatPost p-0">>
                            </div>
                            <div class="col-10">
                                <p class="text-light f-bold m-0">{{$friendsRequest_['name']}}</p>
                                <p class="text-light m-0">Date sent : {{$friendsRequest_['sent_date_only']}}</p>
                            </div>
                        </div>
                        <div class="mb-2">
                            <p class="c-p bg-color-2 d-inline mb-0 px-3 py-1 text-light border border-0 b-round-4 acceptFriendRequest" id="" data-request-id="{{$friendsRequest_["request_id"]}}">Accept</p>
                            <p class="c-p bg-light d-inline mb-0 px-3 py-1 text-dark border border-0 b-round-4 refusetFriendRequest" id="" data-request-id="{{$friendsRequest_["request_id"]}}">Refuse</p>
                        </div>
                    </div>
                    @endforeach
                </div>
                {{-- freinds --}}
                <div class="mt-3 px-2">
                    <p class="f-bold text-light">Freinds</p>
                    @foreach($friendsList as $friend)
                    <div class="bg-color-1 border border-0 b-round-4 p-3 mb-4">
                        <div class="row g-0 al-i-c">
                            <div class="col-2">
                                <img src="@if($friend['profile_picture']!= null){{asset('storage/' .$friend['profile_picture'])}}@endif" alt="profile_picture" class="profile-img-creatPost p-0">
                            </div>
                            <div class="col-10">
                                <p class="text-light f-bold m-0">{{$friend['name']}}</p>
                                <p class="text-light m-0">Date sent : {{$friend['friendship_date']}}</p>
                            </div>
                        </div>
                        <div class="mt-3">
                            <p class="c-p bg-color-2 d-inline mb-0 px-3 py-1 text-light border border-0 b-round-4 endFriendship" id="" data-request-id="{{$friend["friendship_id"]}}">End the friendship :&#x29;</p>
                        </div>
                    </div>
                    @endforeach
                </div>
                {{-- request sent  --}}
                <div class="mt-3 px-2">
                    <p class="f-bold text-light">Request sent</p>
                    <div id="FreindRequestIAlreadySent">
                        @foreach($friendsRequestSeending as $friendRequestSeending)
                        <div class="bg-color-1 border border-0 b-round-4 p-3 mb-4">
                            <div class="row g-0 al-i-c">
                                <div class="col-2">
                                    <img src="@if($friendRequestSeending['profile_picture']!= null){{asset('storage/' .$friendRequestSeending['profile_picture'])}}@endif" alt="profile_picture" class="profile-img-creatPost p-0">
                                </div>
                                <div class="col-10">
                                    <p class="text-light f-bold m-0">{{$friendRequestSeending['name']}}</p>
                                    <p class="text-light m-0">Date sent : {{$friendRequestSeending['sent_date_only']}}</p>
                                </div>
                            </div>
                            <div class="mt-3">
                                <p class="c-p bg-color-2 d-inline mb-0 px-3 py-1 text-light border border-0 b-round-4 deleteFreindRequest" id="" data-request-id="{{$friendRequestSeending["id"]}}">Delete my request</p>
                            </div>
                        </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
@endsection