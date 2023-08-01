package com.example.demo.file;

import java.io.File;
import java.io.IOException;

public class FileUtil 
{
    public static void saveFile(FileVO vo)
    {
        File dirFile = new File(vo.getFilePath());

        if (false == dirFile.exists())
        {
            dirFile.mkdirs();
        }
        
        File file = new File(vo.getFilePath(), vo.getStoredName());

        try {
            System.out.println("file saved : " + file.getAbsolutePath());
            vo.getMultiFile().transferTo(file);

        }
        catch (IllegalStateException e) {
            e.printStackTrace();
        }
        catch (IOException e) {
            e.printStackTrace();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        
    }
    
}
