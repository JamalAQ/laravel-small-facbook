@extends('templates.header')

@section('about us')
<nav class="navbar navbar-expand-lg bg-light container text-light">
    <div class="container-fluid ">
        <a class="navbar-brand text-light bg-dark px-3 mx-3" href="{{ route('dashboard') }}">
            {{ __('navigation.home') }}
        </a>
        <div id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link text-light bg-dark px-3 mx-3" href="">
                        {{ __('navigation.about') }}
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-light bg-dark px-3 mx-3" href="">
                        {{ __('navigation.contact') }}
                    </a>
                </li>
                @auth
                    <li class="nav-item">
                        <form action="{{ route('logout') }}" method="POST" class="d-inline">
                            @csrf
                            <button type="submit" class="btn nav-link text-light bg-dark px-3 mx-3">
                                {{ __('navigation.logout') }}
                            </button>
                        </form>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link text-light bg-dark px-3 mx-3" href="{{ route('profile.edit') }}">
                          {{ __('navigation.contact') }}
                      </a>
                  </li>
                @else
                    <li class="nav-item">
                      {{-- راجع الذهاب الى هاشتاغ ما داخل الروتز  --}}
                        <a class="nav-link text-light bg-dark px-3 mx-3" href="{{ route('login') }}">
                            {{ __('navigation.login') }}
                        </a>
                    </li>
                @endauth
            </ul>
        </div>
    </div>
</nav>
@if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif
<form action="{{route("login")}}" method="POST">
  @csrf
    <div class="mb-3">
      <label for="exampleInputEmail1" class="form-label">Email address</label>
      <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
      <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
    </div>
    <div class="mb-3">
      <label for="exampleInputPassword1" class="form-label">Password</label>
      <input type="password" name="password" class="form-control" id="exampleInputPassword1">
    </div>
    <div class="mb-3 form-check">
      <input type="checkbox" class="form-check-input" id="exampleCheck1">
      <label class="form-check-label" for="exampleCheck1">Check me out</label>
    </div>
    <button type="submit" class="btn btn-primary">login</button>
  </form>
  <a href="{{ route('register') }}" class="bg-primary text-white tf-26">Register</a>      
@endsection
