<?php

namespace App\Http\Controllers\admin\api;

use App\Models\Brand;
use App\Models\Product;
use App\Models\Subcategory;
use App\Http\Services\Media;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\StoreProductRequest;
use App\Http\Requests\UpdateProductRequest;

class ProductController extends Controller
{
    public function index()
    {
        $products = Product::all(); // select * from products
        return response()->json(compact('products'));
    }
    public function create()
    {
        $brands = Brand::all(['id','name_en','name_ar']); // select * from brands
        $subcategories = Subcategory::all(['id','name_en','name_ar']); // select * from subcategories
        return response()->json(compact('brands','subcategories'));
    }

    public function edit($id)
    {
        $product = Product::findOrFail($id);
        $brands = Brand::all(['id','name_en','name_ar']); // select * from brands
        $subcategories = Subcategory::all(['id','name_en','name_ar']); // select * from subcategories
        return response()->json(compact('brands','subcategories','product'));
        //return json[product - brands - subcategories]
    }

    public function store(StoreProductRequest $request)
    {
        $fileName = Media::uploadPhoto($request->file('image'),'products');
        // insert
        $data = $request->except('image');
        $data['image'] = $fileName;
        Product::create($data);
        return response()->json(['success'=>'true','message'=>'Product Created Successfully'],201);
    }

    public function update(UpdateProductRequest $request,$id)
    {
        $data = $request->except('image');
        $product = Product::findOrFail($id);
        if($request->hasFile('image')){
            // upload photo
            $fileName = Media::uploadPhoto($request->file('image'),'products');
            // delete old photo
            Media::deletePhoto('dist\img\products\\'. $product->image);
            $data ['image'] = $fileName;
        }
        // update
        $product->update($data);
        return response()->json(['success'=>'true','message'=>'Product Updated Successfully']);
    }
    public function destroy($id)
    {
        $product = Product::findOrFail($id);
        Media::deletePhoto('dist\img\products\\'. $product->image);
        $product->delete();
        return response()->json(['success'=>true,'msg'=>'Product Deleted Successfully']);
    }
}
