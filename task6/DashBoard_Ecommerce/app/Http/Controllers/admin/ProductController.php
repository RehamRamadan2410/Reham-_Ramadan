<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreProductRequest;
use App\Http\Requests\UpdateProductRequest;
use App\Http\Services\Media;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ProductController extends Controller
{
    public function index()
    {
        // products

        $products = DB::table('products')
            ->leftJoin('brands', 'brands.id', '=', 'products.brand_id')
            ->leftJoin('subcategories', 'subcategories.id', '=', 'products.subcategory_id')
            ->select('products.*', 'brands.name_en AS brand_name_en','brands.name_ar AS brand_name_ar', 'subcategories.name_en AS subcategory_name_en', 'subcategories.name_ar AS subcategory_name_ar')
            ->get();
        return view('admin.products.index',compact('products'));
    }
    public function create()
    {
        // brands - subcategories
        $brands = DB::table('brands')->select('id','name_en','name_ar')->orderBy('name_en')->orderBy('name_ar')->get();
        $subcategories = DB::table('subcategories')->select('id','name_en','name_ar')->orderBy('name_en')->orderBy('name_ar')->get();
        return view('admin.products.create',compact('brands','subcategories'));
    }
    public function edit($id)
    {
        // brands - subcategories - product
        $brands = DB::table('brands')->select('id','name_en','name_ar')->orderBy('name_en')->orderBy('name_ar')->get();
        $subcategories = DB::table('subcategories')->select('id','name_en','name_ar')->orderBy('name_en')->orderBy('name_ar')->get();
        $product = DB::table('products')->where('id',$id)->first();
        return view('admin.products.edit',compact('brands','subcategories','product'));
    }
    public function store(StoreProductRequest $request)
    {
        // upload photo
        $fileName = Media::uploadPhoto($request->file('image'),'products');
        // insert
        $data = $request->except('_token','image');
        $data['image'] = $fileName;
        DB::table('products')->insert($data);
        return redirect()->route('dashboard.products.index')->with('success','Data Created Successfully');
    }
    public function update(UpdateProductRequest $request,$id)
    {
        $data = $request->except('_token','image');
        if($request->hasFile('image')){
            // upload photo
            $fileName = $request->file('image')->hashName();
            $request->file('image')->move(public_path('dist\img\products'),$fileName);
            $oldPhoto = DB::table('products')->select('image')->where('id',$id)->first()->image;
            if(file_exists(public_path('dist\img\products\\'.$oldPhoto))){
                unlink(public_path('dist\img\products\\'.$oldPhoto));
            }
            $data ['image'] = $fileName;
        }
        DB::table('products')->where('id',$id)->update($data);
        return redirect()->route('dashboard.products.index')->with('success','Data Updated Successfully');
    }
    public function destroy($id)
    {
        $oldPhoto = DB::table('products')->select('image')->where('id',$id)->pluck('image')->first();
        if(file_exists(public_path('dist\img\products\\'.$oldPhoto))){
            unlink(public_path('dist\img\products\\'.$oldPhoto));
        }
        DB::table('products')->where('id',$id)->delete();
        return redirect()->back()->with('success','Product Deleted Successfully');
    }
}
