<?php
namespace App\Http\Services;
class Media {
    public static function uploadPhoto($image,$dir)
    {
        $fileName = $image->hashName();
        $image->move(public_path("dist\img\\{$dir}"),$fileName);
        return $fileName;
    }
    public static function deletePhoto(string $path) :bool
    {
        if(file_exists(public_path($path))){
            unlink(public_path($path));
            return true;
        }
        return false;
    }


}
