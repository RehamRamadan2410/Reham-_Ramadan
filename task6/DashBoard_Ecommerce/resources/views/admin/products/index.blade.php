@extends('admin.layouts.app')
@section('title', 'All Products')
@section('css')
    <link rel="stylesheet" href="{{ asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('plugins/datatables-responsive/css/responsive.bootstrap4.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('plugins/datatables-buttons/css/buttons.bootstrap4.min.css') }}" />
@endsection
@section('content')
    <div class="col-12">
        @if (session('success'))
            <div class="alert text-center alert-success">
                {{ session('success') }}
            </div>
        @endif
    </div>
    <div class="col-12">
        <div class="card">
            <div id="datatable_wrapper" class="card-header">
            </div>
            <!-- /.card-header -->
            <div  class="card-body p-0">
                <table id="datatable" class="table table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>Code</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Status</th>
                            <th>Brand</th>
                            <th>Sub Category</th>
                            <th>Creation Date</th>
                            <th>Update Date</th>
                            <th>Operations</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($products as $product)
                            <tr>
                                <td>{{ $product->id }}</td>
                                <td>{{ $product->name_en . ' - ' . $product->name_ar }}</td>
                                <td>{{ $product->code }}</td>
                                <td @class([
                                    'font-weight-bold',
                                    'text-success' => $product->quantity >= 10,
                                    'text-primary' => $product->quantity == 0,
                                    'text-danger' => $product->quantity < 10 && $product->quantity > 0,
                                ])>{{ $product->quantity }}</td>
                                <td>{{ number_format($product->price) }} EGP</td>
                                <td><span
                                        @class([
                                            'badge',
                                            'bg-success' => $product->status,
                                            'bg-danger' => !$product->status,
                                        ])>{{ $product->status == 1 ? 'Active' : 'Not Active' }}</span>
                                </td>
                                <td>{{ $product->brand_name_en . ' - ' . $product->brand_name_ar }}</td>
                                <td>{{ $product->subcategory_name_en . ' - ' . $product->subcategory_name_ar }}</td>
                                <td>{{ $product->created_at }}</td>
                                <td>{{ $product->updated_at }}</td>
                                <td>
                                    <a class="btn btn-outline-primary rounded btn-sm"
                                        href="{{ route('dashboard.products.edit', ['id' => $product->id]) }}">Edit</a>
                                    <form action="{{ route('dashboard.products.destroy', ['id' => $product->id]) }}"
                                        class="d-inline" method="post">
                                        @csrf
                                        <button class="btn btn-outline-danger rounded btn-sm">Delete</button>
                                    </form>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            <!-- /.card-body -->
        </div>
    </div>
@endsection
@section('js')
    <script src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-responsive/js/dataTables.responsive.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-responsive/js/responsive.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-buttons/js/dataTables.buttons.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-buttons/js/buttons.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('plugins/jszip/jszip.min.js') }}"></script>
    <script src="{{ asset('plugins/pdfmake/pdfmake.min.js') }}"></script>
    <script src="{{ asset('plugins/pdfmake/vfs_fonts.js') }}"></script>
    <script src="{{ asset('plugins/datatables-buttons/js/buttons.html5.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-buttons/js/buttons.print.min.js') }}"></script>
    <script src="{{ asset('plugins/datatables-buttons/js/buttons.colVis.min.js') }}"></script>
    <script>
        $(function() {
            $("#datatable").DataTable({
                "responsive": true,
                "lengthChange": false,
                "autoWidth": false,
                "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
            }).buttons().container().appendTo('#datatable_wrapper');
        });
    </script>
@endsection
