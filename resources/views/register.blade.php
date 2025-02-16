@extends('templates.header')

@section('register')
<div class="bg-light pb-3 pb-md-0">
    <div class="container-9 h-md-7">
        <div class="col-12 row j-c-c al-i-c mx-0" style="height: 100%;">
            <h2 class="f-color-1 f-bold col-12 col-md-8 text-md-start text-center my-2 my-md-0 mx-0 p-0">Small facebook</h2>
            <p class="col-12 col-md-1 f-bold f-color-1 text-md-start text-center my-2 my-md-0 mx-0 p-0 c-p">About us</p>
            <p class="col-12 col-md-1 f-bold f-color-1 text-md-start text-center my-2 my-md-0 mx-0 p-0 c-p">Contact us</p>
            <p class="col-12 col-md-1 f-bold f-color-1 text-md-start text-center my-2 my-md-0 mx-0 p-0 c-p">FAQ</p>
            <p class="col-12 col-md-1 f-bold f-color-1 text-md-start text-center my-2 my-md-0 mx-0 p-0"><a href="{{ route('welcome') }}" class="td-n bg-color-1 text-white tf-26 my-3 p-2" style="border-radius: 0.25rem;">Login</a></p>
        </div>
    </div>
</div>
<div class="row al-i-c h-md-93" style="overflow: hidden;">
    <div class="col-12 col-md-9 p-0 mb-3 mb-md-0" style="height:100%" >
        <img src="{{asset('storage/siteimages/072619_socialmedia_phonelikes.avif')}}" alt="welcome image" class="w-100" style="object-fit: cover;height:100%">
    </div>
    <div class="col-12 col-md-3 row j-c-c px-0 g-0">

        <form method="POST" action="{{ route('register') }}" enctype="multipart/form-data" class="col-6">
            @csrf 
            <div class="mb-3">
                <label for="name"  class="form-label text-light f-bold">Name</label>
                <input type="text" id="name" name="name" class="form-control" value="{{ old('name') }}" required>
                @error('name')
                    <p>{{ $message }}</p>
                @enderror
            </div>
            
            <div class="mb-3">
                <label for="email" class="form-label text-light f-bold">Email</label>
                <input type="email" id="email" name="email" class="form-control" value="{{ old('email') }}" required>
                @error('email') 
                    <p>{{ $message }}</p>
                @enderror
            </div>
            
            <div class="mb-3">
                <label for="password" class="form-label text-light f-bold">Password</label>
                <input type="password" id="password" name="password" class="form-control" required>
                @error('password') 
                    <p>{{ $message }}</p>
                @enderror
            </div>
            
            <div class="mb-3">
                <label for="password_confirmation" class="form-label text-light f-bold">Confirm Password</label>
                <input type="password" id="password_confirmation" name="password_confirmation" class="form-control" required>
            </div>
          
            <div class="mb-3">
              <label for="password_confirmation" class="form-label text-light f-bold">profile image</label>
              <input type="file" id="profile_picture" name="profile_picture" class="form-control" required>
            </div>
            
            <div class="mb-3">
                <button type="submit" class="btn btn-light tf-26 my-3 f-color-1">Register</button>
            </div>
        </form>
    </div>
</div>
{{-- <div class="w-100 row j-c-c" style="height: 25vh; overflow: hidden;">
    <img src="{{asset('storage/siteimages/welcom2.jpg')}}" alt="welcom2" style="width:95%;opacity:40%; " class="">
</div> --}}
@endsection