
@extends('admin.admin_dashboard')
@section('admin')
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


<div class="page-content">
    <div class="row profile-body">
      <!-- middle wrapper start -->
            <div class="col-md-8 col-xl-8 middle-wrapper">
            <div class="row">
            <div class="card">
                <div class="card-body">
                 <h6 class="card-title">Edit Admin</h6>

    <form id="myForm" method="POST" action="{{ route('update.admin', $user->id) }}" class="forms-sample">
        @csrf

            <div class="form-group mb-3">
                <label for="exampleInputEmail1" class="form-label">Admin User Name</label>
                <input type="text" name="username" class="form-control" value="{{ $user->username }}">
                @error('username')
                    <span class="text-danger">{{ $message }}</span>
                @enderror
            </div>   

            <div class="form-group mb-3">
                <label for="exampleInputEmail1" class="form-label">Admin Name</label>
                <input type="text" name="name" class="form-control" value="{{ $user->name }}">
                @error('name')
                    <span class="text-danger">{{ $message }}</span>
                @enderror
            </div>       

            <div class="form-group mb-3">
                <label for="exampleInputEmail1" class="form-label">Admin Email</label>
                <input type="email" name="email" class="form-control" value="{{ $user->email }}">
                @error('email')
                    <span class="text-danger">{{ $message }}</span>
                @enderror
            </div>    

            <div class="form-group mb-3">
                <label for="exampleInputEmail1" class="form-label">Admin Phone</label>
                <input type="text" name="phone" class="form-control" value="{{ $user->phone }}">
                @error('phone')
                    <span class="text-danger">{{ $message }}</span>
                @enderror
            </div>      

            <div class="form-group mb-3">
                <label for="exampleInputEmail1" class="form-label">Admin Address</label>
                <input type="text" name="address" class="form-control" value="{{ $user->address }}">
                @error('address')
                    <span class="text-danger">{{ $message }}</span>
                @enderror
            </div>  


            <div class="form-group mb-3">
                <label for="exampleInputEmail1" class="form-label">Role Name</label>

                <select name="roles" class="form-select" id="exampleFormControlSelect1">
                    <option selected="" disabled="">Select Role</option>

                    @foreach ($roles as $role)
                    <option value="{{ $role->name }}" {{ $user->hasRole($role->name) ? 'selected' : '' }}>{{ $role->name }}</option>
                    @endforeach
                </select>
                @error('roles')
                    <span class="text-danger">{{ $message }}</span>
                @enderror

            </div>       

            <button type="submit" class="btn btn-primary me-2">Save Changes</button>
      </form>
    </div>
    </div>

     </div>
     </div>
      <!-- middle wrapper end -->
      </div>

  </div>

@endsection

