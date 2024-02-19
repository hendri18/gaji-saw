<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DataTables;
use App\Models\User;
use Spatie\Permission\Models\Role;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $users = User::select(['id', 'name', 'email'])->with('roles');
        return DataTables::of($users)
        ->addColumn('roles', function($data) {
            return implode(" ,", ($data->roles->map(function ($item){
                return $item->name;
            })->toArray() ?? []));
        })
        ->make(true);
    }

    public function getRoles()
    {
        try {
            $roles = Role::all()->map(function($item) {
                return $item;
            });
            return response()->json([
                "message" => "success",
                "data" => $roles
            ]);
        } catch(Exception $e) {
            return response()->json([
                "message" => $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validation_data = [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255'],
            'role_id' => ['required', 'string'],
        ];

        if (!empty($request->password)) {
            $validation_data['password'] = ['confirmed','required'];
        }
        $request->validate($validation_data);
        try {
            $user = new User();
        
            $user->name = $request->name;
            $user->email = $request->email;
            if (!empty($request->password)) {
                $user->password = Hash::make($request->password);
            }
            $user->save();

            $role = Role::where('id', ($request->role_id ?? 0))->get();
            $user->syncRoles($role);

            return response()->json([
                "id" => $user->id,
                "message" => "User Berhasil ditambahkan"
            ]);
        } catch(Exception $e) {
            return response()->json([
                "message" => $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        try {
            $user = User::findOrFail($id);
            return response()->json([
                "message" => "success",
                "data" => array_merge($user->toArray(), [
                    'role_id' => $user->roles->pluck('id')->implode('') ?? [],
                ]),
            ]);
        } catch(Exception $e) {
            return response()->json([
                "message" => $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $validation_data = [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255'],
            'role_id' => ['required', 'string'],
        ];

        if (!empty($request->password)) {
            $validation_data['password'] = ['confirmed','required'];
        }
        $request->validate($validation_data);
        try {
            $user = User::findOrFail($id);
        
            $user->name = $request->name;
            $user->email = $request->email;
            if (!empty($request->password)) {
                $user->password = Hash::make($request->password);
            }
            $user->save();

            $role = Role::where('id', ($request->role_id ?? 0))->get();
            $user->syncRoles($role);

            return response()->json([
                "id" => $user->id,
                "message" => "User Berhasil diubah"
            ]);
        } catch(Exception $e) {
            return response()->json([
                "message" => $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {
            $user = User::findOrFail($id);
            $user->delete();

            return response()->json([
                "message" => "User Berhasil dihapus"
            ]);
        } catch(Exception $e) {
            return response()->json([
                "message" => $e->getMessage(),
            ], 500);
        }
    }
}
