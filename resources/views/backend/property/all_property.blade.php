
@extends('admin.admin_dashboard')
@section('admin')

<div class="page-content">

    <nav class="page-breadcrumb">
        <ol class="breadcrumb">
            <a href="{{ route('add.amenitie') }}" class="btn btn-inverse-light">Add Property</a>
        </ol>
    </nav>

    <div class="row">
        <div class="col-md-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h6 class="card-title">Property All</h6>
                    <div class="table-responsive">
                        <table id="dataTableExample" class="table">
                            <thead>
                                <tr>
                                    <th>SL</th>
                                    <th>Image</th>
                                    <th>Name</th>
                                    <th>Property Type</th>
                                    <th>Status Type</th>
                                    <th>City</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>

                                @foreach ($property as $key => $item)                               
                                    <tr>
                                        <td>{{ $key+1 }}</td>
                                        <td><img src="{{ asset($item->property_thambnail) }}"
                                             style="width: 70px; height:40px;"></td> 
                                        <td>{{ $item->property_name }}</td> 
                                        <td>{{ $item->ptype_id }}</td> 
                                        <td>{{ $item->property_status }}</td> 
                                        <td>{{ $item->city }}</td> 
                                        <td>
                                            
                                            @if ($item->status == 1)
                                            <span class="badge rounded-pill bg-success">Active</span>
                                            @else
                                            <span class="badge rounded-pill bg-danger">Inactive</span>
                                            @endif

                                        </td> 
                            
                                        <!-- Change here -->
                                        <td>
                                            <a href="{{ route('edit.amenitie', $item->id) }}" class="btn btn-inverse-warning">Edit</a>
                                            <a href="{{ route('delete.amenitie', $item->id) }}" class="btn btn-inverse-danger" id="delete">Delete</a>
                                        </td>
                                    </tr>
                                @endforeach

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

@endsection
