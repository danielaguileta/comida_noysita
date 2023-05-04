@extends('adminlte::page')

@section('title', 'Clientes')

@section('content_header')
<h1>Gestion de clientes</h1>
@stop

@section('content')
<div class="col-md-12"><br>
    <div class="card card-primary">
        <div class="card-header">
            <h3 class="card-title">Clientes</h3>
        </div>
        <div class="card-body">
            @csrf
            <div class="card-content">
            @can('crear-cliente')
                <a class="btn btn-success float-right" href="{{ route('clientes.create') }}">
                    <i class="fas fa-plus"></i>
                    Nuevo Cliente
                </a>
                <br>
                <br>
            @endcan

            </div>
            <table id="clientes" class="display responsive nowrap" style="width:100%">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Identidad</th>
                        <th>RTN</th>
                        <th>Direccion</th>
                        <th>Tipo Pago</th>
                        <th>Fecha ingreso</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>

                    @foreach($clientes as $cliente)
                    <tr>
                        <td>{{$cliente['NOMBRE_CLIENTE']}}</td>
                        <td>{{$cliente['IDENTIDAD_CLIENTE']}}</td>
                        <td>{{$cliente['RTN_CLIENTE']}}</td>
                        <td>{{$cliente['DIRECCION']}}</td>
                        <td>{{$cliente['TIPO_PAGO']}}</td>
                        <td>{{$cliente['FECHA_INGRESO_CLIENTE']}}</td>
                        <td width='10px'>
                            <form action="{{route('clientes.destroy' ,$cliente['COD_CLIENTE'])}}" method="POST" class="eliminar_cliente">
                            @can('editar-cliente')
                            <a class="btn btn-warning " href="{{route('clientes.edit', $cliente['COD_CLIENTE'])}}">
                                    <i class="far fa-edit">
                                    </i>
                                </a>
                            @endcan
                                @csrf
                                @method('DELETE')
                                @can('borrar-cliente')
                                <button class="btn btn-danger">
                                    <i class="fas fa-trash-alt">
                                    </i>
                                </button>
                                @endcan
                            </form>

                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
        <!-- /.card-body -->
    </div>
    <!-- /.card -->
</div>
@stop

@section('css')
<link rel="stylesheet" href="/css/admin_custom.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/rowreorder/1.2.8/css/rowReorder.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.dataTables.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.3.2/css/buttons.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.3.2/css/buttons.dataTables.min.css">
@stop

@section('js')
<script>
    console.log('Hi!');
</script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/rowreorder/1.2.8/js/dataTables.rowReorder.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.3.0/js/dataTables.responsive.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.datatables.net/buttons/2.3.2/js/dataTables.buttons.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/2.3.2/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.3.2/js/buttons.print.min.js"></script>



<script>
    @if(Session::has('agregado'))
    toastr.options = {
        "closeButton": false,
        "progressBar": true,
        "timeOut": 3000

    }
    toastr.success("{{ session('agregado') }}");
    @endif
</script>

<script>
    @if(Session::has('eliminado'))
    toastr.options = {
        "closeButton": false,
        "progressBar": true,
        "timeOut": 3000

    }
    toastr.success("{{ session('eliminado') }}");
    @endif
</script>

<script>
    @if(Session::has('editado'))
    toastr.options = {
        "closeButton": false,
        "progressBar": true,
        "timeOut": 3000

    }
    toastr.success("{{ session('editado') }}");
    @endif
</script>

<script>
    $('.eliminar_cliente').submit(function(e) {
        e.preventDefault();

        Swal.fire({
            title: 'Estas seguro?',
            text: "El registro se eliminara definitivamente",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#5cb85c',
            cancelButtonText: 'Regresar',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si, eliminar!'
        }).then((result) => {
            if (result.isConfirmed) {
                /*     Swal.fire(
                'Deleted!',
                'Your file has been deleted.',
                'success'
                ) */

                this.submit();
            }
        })

    });
</script>

<script>
    $(document).ready(function() {
        $('#clientes').DataTable({
            dom: 'Bfrtip',
            buttons: [
                'excel', 'pdf', 'print'
            ]
        });
    });
</script>


@stop