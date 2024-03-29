<?php

namespace App\Http\Controllers;

use App\Http\Requests\ValidacionEmpleado;
use App\Models\empleado;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;




class empleadoscontroller extends Controller
{

    function __construct()
    {
        $this->middleware('permission:ver-empleado' ,['only'=>['index']] );
        $this->middleware('permission:ver-empleado' ,['only'=>['create', 'store']] );
        $this->middleware('permission:ver-empleado' ,['only'=>['edit', 'update']] );
        $this->middleware('permission:ver-empleado' ,['only'=>['destroy']] );

    }   
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        /* $empleados = Http::get('https://noysitaapi-production-4864.up.railway.app/empleados/')->json();
         */
        $empleados = Http::get('http://localhost:9000/empleados/')->json();
    
        return view('empleados.index',compact('empleados')); 

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('empleados.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(ValidacionEmpleado $request)
    {
  /*       $empleados = Http::post('https://noysitaapi-production-4864.up.railway.app/insertar_empleado', [
            'NOMBRE_EMPLEADO'=> $request->nombre,
            'IDENTIDAD_EMPLEADO' => $request->identidad,
            'EDAD_EMPLEADO' => $request->edad,
            'CORREO_EMPLEADO'=> $request->correo_empleado,
            'NUMERO_CELULAR_EMPLEADO' => $request->numero_celular,
            'ESTADO_CIVIL_EMPLEADO' => $request->estado_civil,
            'INICIO_CONTRATO' => $request->inicio_contrato,
            'CARGO_EMPLEADO' => $request->cargo_empleado,  
            'SALARIO_EMPLEADO' => $request->salario, 
            'FECHA_INGRESO' => $request->fecha_ingreso,                     
        ]); 
 */

        $empleados = Http::post('http://localhost:9000/insertar_empleado', [
            'NOMBRE_EMPLEADO'=> $request->nombre,
            'IDENTIDAD_EMPLEADO' => $request->identidad,
            'EDAD_EMPLEADO' => $request->edad,
            'CORREO_EMPLEADO'=> $request->correo_empleado,
            'NUMERO_CELULAR_EMPLEADO' => $request->numero_celular,
            'ESTADO_CIVIL_EMPLEADO' => $request->estado_civil,
            'INICIO_CONTRATO' => $request->inicio_contrato,
            'CARGO_EMPLEADO' => $request->cargo_empleado,  
            'SALARIO_EMPLEADO' => $request->salario, 
            'FECHA_INGRESO' => $request->fecha_ingreso,                     
        ]); 

           return redirect()-> route('empleados.index')->with('agregado','El empleado fue agregado correctamente'); 
    }

    

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($COD_EMPLEADO)
    {
        $empleados = Empleado::findorfail($COD_EMPLEADO); 
        
        return view('empleados.edit', compact('empleados')); 
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(ValidacionEmpleado $request, $COD_EMPLEADO)
    {
/*         $empleados = Http::put('https://noysitaapi-production-4864.up.railway.app/empleados/edit/' .$COD_EMPLEADO ,[
            'NOMBRE_EMPLEADO'=> $request->nombre,
            'IDENTIDAD_EMPLEADO' => $request->identidad,
            'EDAD_EMPLEADO' => $request->edad,
            'CORREO_EMPLEADO'=> $request->correo_empleado,
            'NUMERO_CELULAR_EMPLEADO' => $request->numero_celular,
            'ESTADO_CIVIL_EMPLEADO' => $request->estado_civil,
            'INICIO_CONTRATO' => $request->inicio_contrato,
            'CARGO_EMPLEADO' => $request->cargo_empleado,  
            'SALARIO_EMPLEADO' => $request->salario, 
            'FECHA_INGRESO' => $request->fecha_ingreso,                     
        ]); 
 */
        $empleados = Http::put('http://localhost:9000/empleados/edit/' .$COD_EMPLEADO ,[
            'NOMBRE_EMPLEADO'=> $request->nombre,
            'IDENTIDAD_EMPLEADO' => $request->identidad,
            'EDAD_EMPLEADO' => $request->edad,
            'CORREO_EMPLEADO'=> $request->correo_empleado,
            'NUMERO_CELULAR_EMPLEADO' => $request->numero_celular,
            'ESTADO_CIVIL_EMPLEADO' => $request->estado_civil,
            'INICIO_CONTRATO' => $request->inicio_contrato,
            'CARGO_EMPLEADO' => $request->cargo_empleado,  
            'SALARIO_EMPLEADO' => $request->salario, 
            'FECHA_INGRESO' => $request->fecha_ingreso,                     
        ]); 

           return redirect()-> route('empleados.index')->with('Editado','El empleado fue editado correctamente'); 
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($COD_EMPLEADO)
    {
        /* $empleados = Http::delete('https://noysitaapi-production-4864.up.railway.app/empleados/delete/'. $COD_EMPLEADO); */

        $empleados = Http::delete('http://localhost:9000/empleados/delete/'. $COD_EMPLEADO);

        return redirect()-> route('empleados.index')->with('eliminado','El empleado fue eliminado correctamente'); 
    }
}
