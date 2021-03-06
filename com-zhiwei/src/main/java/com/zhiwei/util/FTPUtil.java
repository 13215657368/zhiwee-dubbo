package com.zhiwei.util;



import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.io.InputStream;

/**
 * Created by jick on 2019/3/26.
 */
//文件上传工具类
public class FTPUtil {

    private  static Logger logger  = LoggerFactory.getLogger(FTPUtil.class);


    //文件上传
    public static String  fileUpload(String  host,Integer port,
                                      String username,String password,
                                      String  path,String fileName,InputStream inputStream) {
        //1、创建ftpclinet对象
        FTPClient ftpClient  =  new FTPClient();
        ftpClient.enterLocalPassiveMode();

        try {

            //保存ftp控制连接使用的字符集，必须在连接前设置
            ftpClient.setControlEncoding("UTF-8");
            //指定服务器端口
           // ftpClient.connect(host,port);
            ftpClient.connect("127.0.0.1",port);//放在服务器上使用本地端口

            //指定用户名和密码
            ftpClient.login(username,password);


            //连接成功或者失败返回的状态码
           int   reply  = ftpClient.getReplyCode();

            //如果replay返回230表示成功，返回530表示无密码或者用户名错误权限问题等等
            System.out.println(reply);

            //具体的搜索ftp上传常见的错误详解
           if(!FTPReply.isPositiveCompletion(reply)){
                ftpClient.disconnect();
                logger.error("文件上传失败，服务器用户名密码错误");
                return  null;
            }


            //本地输入流
          //  File  file =  new File("d:\\img.jpg");
            //   local  = new FileInputStream(file);

            //5、指定上传的路径，如果没有创建需要创建
            //     String  path  =   "/home/ftpuser/ego/test/";

            String   basePath = "/";

            for(String p : path.split("/")){
                basePath += (p+"/");
                //判断目录是否存在
                boolean     hasPath  =  ftpClient.changeWorkingDirectory(path);

                if(!hasPath){
                    //创建目录 一次只能创建一个
                    System.out.println(basePath);
                    ftpClient.makeDirectory(basePath);
                }
            }


            //重新指定上传路径
            ftpClient.changeWorkingDirectory(basePath);

            //指定上传的方式为二进制
            ftpClient.setFileType(FTP.BINARY_FILE_TYPE);

            //得到文件后缀
            String  suffix =  fileName.substring(fileName.lastIndexOf("."));

            //remote指定上传远程服务器的文件名
            String    remote   =  UUIDUtil.getUUID()+suffix;
            //ftpClient.storeFile(UUID.randomUUID().toString()+suffix,local);
            //ftpClient.enterLocalPassiveMode();
           // try {
                Boolean b = ftpClient.storeFile(remote,inputStream);
                System.out.print("上传结果"+b);
          //  }catch ( Exception e){
          //      System.out.print("上传失败");
           // }
            if(b==true) {
                return remote;
            }

        } catch (Exception e) {
          logger.error("文件上传失败，程序异常");
        }finally {
            try {
                if(inputStream != null)
                    inputStream.close();
                ftpClient.logout();
                if(ftpClient.isConnected())
                    ftpClient.disconnect();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return  null;

    }

    //删除图片
    public  static   boolean   fileDelete(String host,Integer port,String username,
                                          String password,String pathName,String path){
        FTPClient  ftpClient =   new FTPClient();

        ftpClient.setControlEncoding("UTF-8");
        boolean result = false;

        try {
           // ftpClient.connect(host,port);
            ftpClient.connect("127.0.0.1",port);//放在服务器上使用本地端口
            ftpClient.login(username,password);
            int  replay =   ftpClient.getReplyCode();
            System.out.println(replay);

            if(!FTPReply.isPositiveCompletion(replay)){
                ftpClient.disconnect();
                logger.error("用户名或密码错误或用户权限问题");
                return  result;
            }
            String[]   pathArray  =  pathName.split("/");

            //拼接；路径
            path  += "/" + pathArray[3] + "/" + pathArray[4] + "/" + pathArray[5];

            String  basePath =  "/";

            for(String p : path.split("/")){
                basePath+=(p+"/");

                //判断目录是否存在
                boolean   hasPath =  ftpClient.changeWorkingDirectory(basePath);

                if(!hasPath){
                    logger.error("删除失败，目录不存在");
                    return  result;
                }

            }

            result =  ftpClient.deleteFile(path+"/"+pathArray[6]);

            if (!result) {
                logger.error(" 删除失败，文件不存在！");
            }



        } catch (IOException e) {
           // e.printStackTrace();
            logger.error("删除失败，文件不存在");
        }finally {
            try {
                ftpClient.logout();
                if (ftpClient.isConnected()) {
                    ftpClient.disconnect();
                }
            } catch (IOException e) {
                logger.error(" 删除失败：" + e.getMessage());
            }
        }
        return  result;
    }




    //删除视频
    public  static   boolean   videoDelete(String host,Integer port,String username,
                                          String password,String pathName,String path){
        FTPClient  ftpClient =   new FTPClient();

        ftpClient.setControlEncoding("UTF-8");
        boolean result = false;

        try {
           // ftpClient.connect(host,port);
            ftpClient.connect("127.0.0.1",port);//服务器上使用本地端口
            ftpClient.login(username,password);
            int  replay =   ftpClient.getReplyCode();
            System.out.println(replay);

            if(!FTPReply.isPositiveCompletion(replay)){
                ftpClient.disconnect();
                logger.error("用户名或密码错误或用户权限问题");
                return  result;
            }
            String[]   pathArray  =  pathName.split("/");
            //  0   1   2                3   4  5       6
            //http://118.31.67.29:8811/2019/07/05/8f610e676c5942cdb1d6f7119e476d51.jpg
            //     0   1   2                     3
            //   http://118.31.67.29:8036/b019dac2bd95498c94bffcd65c76ae52.mp4
            //拼接；路径
          // path  += "/" + pathArray[3] + "/" + pathArray[4] + "/" + pathArray[5];

        //    String  basePath =  "/";
/*
            for(String p : path.split("/")){
                basePath+=(p+"/");

                //判断目录是否存在
                boolean   hasPath =  ftpClient.changeWorkingDirectory(basePath);*/

          /*      if(!hasPath){
                    logger.error("删除失败，目录不存在");
                    return  result;
                }

            }*/

            result =  ftpClient.deleteFile(path+"/"+pathArray[3]);

            if (!result) {
                logger.error(" 删除失败，文件不存在！");
            }



        } catch (IOException e) {
            // e.printStackTrace();
            logger.error("删除失败，文件不存在");
        }finally {
            try {
                ftpClient.logout();
                if (ftpClient.isConnected()) {
                    ftpClient.disconnect();
                }
            } catch (IOException e) {
                logger.error(" 删除失败：" + e.getMessage());
            }
        }
        return  result;
    }






}
