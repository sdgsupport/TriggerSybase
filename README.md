# TriggerSybase

Pasos:

1. En Advantage Data Architect, crear el diccionario de datos colocando la dirección donde se ubica la base de datos.

   ![image](https://github.com/user-attachments/assets/76027c2c-02f4-4683-aa84-723d03813555)
   ![image](https://github.com/user-attachments/assets/b93b4e47-ba2c-4f87-a716-da3795f7282c)


2. Clic derecho en la sección TABLES y clic en Add Existing Tables para agregar la tabla Card.

   ![image](https://github.com/user-attachments/assets/fa684b28-3925-4141-bc00-595f32f54db8)
   ![image](https://github.com/user-attachments/assets/5319150e-67ce-4f6a-9afc-7d116a6d3ca6)


3. En Visual Studio, Clic derecho en el proyecto y clic en Recompilar.

   ![image](https://github.com/user-attachments/assets/4b0261d9-c775-45b0-a180-f2da9a3f2766)
   ![image](https://github.com/user-attachments/assets/07930650-364b-497f-ac3d-4ba52d30e201)


4. Ubicar el archivo .dll del proyecto de .Net, que se encuentra en la carpeta \bin\Debug. Por ejemplo:

  ![image](https://github.com/user-attachments/assets/e1da2791-b1d8-4f5a-9cb1-9319e9b18a65)


5. Copiar el archivo .dll y pegarlo en la carpeta donde se encuentre el diccionario de datos.

   ![image](https://github.com/user-attachments/assets/d6923dfc-9cc9-4f0a-8d06-8490e334d69f)


6. Ingresar al CMD como administrador, y con el comando cd ubicarse en donde se encuentra el diccionario de datos. Por ejemplo:

  ![image](https://github.com/user-attachments/assets/c444c609-90f2-4317-b419-fc351c650b27)


7. Ubicar en donde se ubica la herramienta RegAsm.exe, regularmente ubicado en la dirección C:\Windows\Microsoft.NET\Framework\v4.0.30319 .Por ejemplo:

  ![image](https://github.com/user-attachments/assets/3b1126aa-eb03-4343-95de-df0129a7ba6b)


8. Con el RegAsm.exe ubicado, ya podemos ejecutar el siguiente comando para registrar el .dll con /codebase (la ubicación varia de donde se encontró el RegAsm.exe):

   ![image](https://github.com/user-attachments/assets/9c63808e-bc0c-497b-8e8a-83e4eefa341d)


9. Con el .dll registrado, podemos volver al Data Architect, donde se encuentra la tabla Card. Dar clic derecho sobre la tabla y crear el trigger.

   ![image](https://github.com/user-attachments/assets/93b2d0aa-5d5c-4118-a7bf-3bf812a9b21a)
   ![image](https://github.com/user-attachments/assets/a42d75cd-b5ef-4875-abf6-71adb59c6894)
   ![image](https://github.com/user-attachments/assets/1f257e2e-833d-4ad1-98a6-cc64fe948328)


11. Abrir el script que viene en el proyecto.

    ![image](https://github.com/user-attachments/assets/273b8133-fe88-442f-8ad6-512ff5baccfe)
    ![image](https://github.com/user-attachments/assets/fe064f20-86fe-4021-871c-ff016b544845)


10. Ejecutar esta instrucción para que pueda funcionar el trigger.

    ![image](https://github.com/user-attachments/assets/3ec0d9f4-e931-4224-bd90-e65537dee0d9)

    
11. Ejecutar esta instrucción insert y hacer el select para poder ver el registro realizado.

    ![image](https://github.com/user-attachments/assets/1ce28ff3-ed25-4d0d-8cc5-4bab120c389b)


