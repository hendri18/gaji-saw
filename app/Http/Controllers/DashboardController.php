<?php

namespace App\Http\Controllers;

use Auth;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\PengambilanKeputusanExport;

class DashboardController extends Controller
{

    public function logout(Request $request)
    {
        Auth::logout();
    
        $request->session()->invalidate();
    
        $request->session()->regenerateToken();
    
        return redirect('/');
    }

    public function export(Request $request)
    {
        if ($request->type == 'pdf') {
            return Excel::download(new PengambilanKeputusanExport, 'result-'.date('Y-m-d').'.pdf', \Maatwebsite\Excel\Excel::DOMPDF);
        }
        return Excel::download(new PengambilanKeputusanExport, 'result-'.date('Y-m-d').'.xlsx');
    }
}
