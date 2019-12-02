<?php

namespace App\Http\Controllers;

use App\Folder;
use Illuminate\Http\Request;

class TaskController extends Controller
{
    // URLの変数を引数として受け取る
    public function index(int $id)
    {
        // 全てのデータを取得
        $folders = Folder::all();

        // 第一引数がテンプレートファイル名
        return view('tasks/index', [
            // 第二引数がテンプレートに渡すデータ
            'folders' => $folders,
            'current_folder_id' => $id,
        ]);
    }
}