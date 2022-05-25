<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use App\Models\Pets;
use App\Models\PetImages;
use App\Models\PetCategories;
use App\Models\PetTags;
use App\Models\PetTagsAsigned;

class PetsController extends Controller
{

    public function addPet(Request $request){

        if(!isset($request->category) || !isset($request->name)){
            return response()->json(array("result"=>false,"msg"=>"Debe rellenar los campos requeridos"), 200);
        }

        $category = $request->category;
        $name = $request->name;

        $pet = Pets::create([
            "id_category" => $category,
            "name" => $name,
            "status" => "pending"
        ]);

        if($request->TotalFiles > 0 ){
            for($x = 0; $x < $request->TotalFiles; $x++){
                if($request->hasFile('photos'.$x)){
                    $file = $request->file('photos'.$x);

                    $ext = $file->getClientOriginalExtension();
                    $permitidas = array("png","jpg","jpeg");

                    if(!in_array(strtolower($ext),$permitidas)){
                        $pet->delete();
                        return response()->json(array("result"=>false,"msg"=>"La imagen subida no es valida, solo se aceptan png, jpg, jpeg"), 405);
                    }

                    $imagetemp = md5(date("Y-m-d-H-i-s").rand(0,999).rand(0,999).rand(0,999)).".".$ext;
                    $file->move('photos/',$imagetemp);

                    PetImages::create([
                        "id_pet" => $pet->id,
                        "image" => $imagetemp
                    ]);

                }
            }
        }
        

        $tags = $request->tags;

        $exp = explode(",",$tags);

        foreach($exp as $tag){
            PetTagsAsigned::create([
                "id_pet" => $pet->id,
                "id_tag" => $tag
            ]);
        }

        return response()->json(array("result"=>true,"msg"=>"Se ha guardado la mascota satisfactoriamente"),200);
    }

    public function getPets(Request $request){
        $pets = Pets::with('tags')->with('category')->with('photos')->get();

        $final_pets = array();

        foreach($pets as $pet){



        }

        return response()->json(array("result"=>true, "msg"=>"Mascotas listadas satisfactoriamente", "data"=>$pets));
    }

    public function getPetByStatus(Request $request){


        if(!isset($request->status)){
            return response()->json(array("result"=>false, "msg"=>"Se necesita el status"), 200);
        }

        $status = $request->status;

        $exp = explode(",",$status);

        $pets = Pets::whereIn('status', $exp)->with('tags')->with('category')->with('photos')->get();

        return response()->json(array("result"=>true,"msg"=>"Mascotas encontradas", "data"=>$pets), 200);
    }

    public function getPetById(Request $request){
    
        if(empty($request->id)){
            return response()->json(array("result"=>false,"msg"=>"Se necesita un id para esta peticion"), 200);
        }

        $id = $request->id;

        $pet = Pets::where('id',$id)->with('category')->with('tags')->with('photos')->get();

        if($pet->count()==0){
            return response()->json(array("result"=>false,"msg"=>"Pet not found"),404);
        }

        return response()->json(array("result"=>true,"msg"=>"Mascota encontrada", "data"=>$pet), 200);

    
    }

    public function borrarImagen(Request $request){    
        if(empty($request->id)){
            return response()->json(array("result"=>false,"msg"=>"Se necesita un id para esta peticion"), 200);
        }

        $id = $request->id;

        $imagen = PetImages::where('id',$id);

        $imagen->delete();

        return response()->json(array("result"=>true,"msg"=>"Se ha borrado la imagen satisfactoriamente"), 200);
    }



    public function editPet(Request $request){

        if(!isset($request->category) || !isset($request->name) || !isset($request->id)){
            return response()->json(array("result"=>false,"msg"=>"Debe rellenar los campos requeridos"), 200);
        }

        $category = $request->category;
        $name = $request->name;
        $status = $request->status;

        $pet = Pets::where('id',$request->id)->first();

        $pet->id_category = $category;
        $pet->name = $name;
        $pet->status = $status;
        $pet->save();

        if($request->TotalFiles > 0 ){
            for($x = 0; $x < $request->TotalFiles; $x++){
                if($request->hasFile('photos'.$x)){
                    $file = $request->file('photos'.$x);

                    $ext = $file->getClientOriginalExtension();
                    $permitidas = array("png","jpg","jpeg");

                    if(!in_array(strtolower($ext),$permitidas)){
                        $pet->delete();
                        return response()->json(array("result"=>false,"msg"=>"La imagen subida no es valida, solo se aceptan png, jpg, jpeg"), 405);
                    }

                    $imagetemp = md5(date("Y-m-d-H-i-s").rand(0,999).rand(0,999).rand(0,999)).".".$ext;
                    $file->move('photos/',$imagetemp);

                    PetImages::create([
                        "id_pet" => $pet->id,
                        "image" => $imagetemp
                    ]);

                }
            }
        }

        $deleteTags = PetTagsAsigned::where('id_pet',$pet->id);
        $deleteTags->delete();

        

        $tags = $request->tags;

        $exp = explode(",",$tags);

        foreach($exp as $tag){
            PetTagsAsigned::create([
                "id_pet" => $pet->id,
                "id_tag" => $tag
            ]);
        }

        return response()->json(array("result"=>true,"msg"=>"Se ha editado la mascota satisfactoriamente"),200);

    }

    public function editPetInStore(Request $request){
        if(!isset($request->id) || !isset($request->name) || !isset($request->status)){
            return response()->json(array("result"=>false,"msg"=>"Debe rellenar los campos requeridos"), 200);
        }

        $id = $request->id;
        $name = $request->name;
        $status = $request->status;

        $pet = Pets::where('id',$id)->first();

        $pet->name = $name;
        $pet->status = $status;
        $pet->save();

        return response()->json(array("result"=>true, "msg"=>"Se ha actualizado la información"), 200);
        
    } 

    public function deletePet(Request $request){
        if(empty($request->id)){
            return response()->json(array("result"=>false, "msg"=>"Falta el id"),200);
        }

        $id = $request->id;


        $pet = Pets::where('id',$id);

        $pet->delete();

        return response()->json(array("result"=>true, "msg"=>"Se ha eliminado la mascota"),200);
    }




    public function listaCategorias(Request $request){
        $categories = PetCategories::get();
        return response()->json(array("result"=>true,"msg"=>"Información encontrada","data"=>$categories));
    }

    public function listaTags(Request $request){
        $tags = PetTags::get();
        
        return response()->json(array("result"=>true,"msg"=>"Información encontrada","data"=>$tags));
    }
}
