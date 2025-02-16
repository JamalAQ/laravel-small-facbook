@extends('templates.header')

@section('welcome')
<div class="bg-light pb-3 pb-md-0">
    <div class="container-9 h-md-7">
        <div class="col-12 row j-c-c al-i-c mx-0" style="height: 100%;">
            <h2 class="f-color-1 f-bold col-12 col-md-8 text-md-start text-center my-2 my-md-0 mx-0 p-0">Small facebook</h2>
            <p class="col-12 col-md-1 f-bold f-color-1 text-md-start text-center my-2 my-md-0 mx-0 p-0 c-p">About us</p>
            <p class="col-12 col-md-1 f-bold f-color-1 text-md-start text-center my-2 my-md-0 mx-0 p-0 c-p">Contact us</p>
            <p class="col-12 col-md-1 f-bold f-color-1 text-md-start text-center my-2 my-md-0 mx-0 p-0 c-p">FAQ</p>
            <p class="col-12 col-md-1 f-bold f-color-1 text-md-start text-center my-2 my-md-0 mx-0 p-0"><a href="{{ route('register') }}" class="td-n bg-color-1 text-white tf-26 my-3 p-2" style="border-radius: 0.25rem;">Register</a></p>
        </div>
    </div>
</div>
<div class="row al-i-c h-md-93" style="overflow: hidden;">
    <div class="col-12 col-md-9 p-0 mb-3 mb-md-0" style="height:100%" >
        <img src="{{asset('storage/siteimages/072619_socialmedia_phonelikes.avif')}}" alt="welcome image" class="w-100" style="object-fit: cover;height:100%">
    </div>
    <div class="col-12 col-md-3 row j-c-c px-0 g-0">

        <form action="{{route("login")}}" method="POST" class="col-6">
            @csrf
            @if ($errors->any())
                <div class="alert alert-danger">
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label text-light f-bold">Email address</label>
                <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
            </div>
            <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label text-light f-bold">Password</label>
                <input type="password" name="password" class="form-control" id="exampleInputPassword1">
            </div>
            <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                <label class="form-check-label text-light" for="exampleCheck1 ">Check me out</label>
            </div>
            <button type="submit" class="btn btn-light f-color-1">login</button>
            <div class="col-2">
                <a href="{{ route('register') }}" class="btn btn-light tf-26 my-3 f-color-1">Register</a>      
            </div>
        </form>
    </div>
</div>
{{-- <div class="w-100 row j-c-c" style="height: 25vh; overflow: hidden;">
    <img src="{{asset('storage/siteimages/welcom2.jpg')}}" alt="welcom2" style="width:95%;opacity:40%; " class="">
</div> --}}
@endsection
