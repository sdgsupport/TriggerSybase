using Advantage.Data.Provider;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Dynamic;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Text;
using System.Threading.Tasks;

namespace TriggerSybase
{
    public class trigger
    {   
        public int triggerInsert(Int32 ulConnectionID, Int32 hConnection, String strTriggerName, String strTableName,
                      Int32 ulEventType, Int32 ulTriggerType, Int32 ulRecNo)
        { 
            AdsConnection conn = new AdsConnection("ConnectionHandle="+hConnection.ToString());
            AdsCommand cmd;
            AdsCommand cmdNew;
            AdsExtendedReader extReader;
            AdsDataReader reader;
            dynamic user = new ExpandoObject();
            Guid guid = Guid.NewGuid();
            string s = guid.ToString();
            try
            {
                conn.Open();
                cmd = conn.CreateCommand();
                cmdNew = conn.CreateCommand();
                

                cmd.CommandText = "SELECT PkData, CardNumberFormatted, UserName, Email, Picture FROM __new";
                reader = cmd.ExecuteReader();

                //cmdNew.CommandText = "select*from ["+ strTableName + "]";
                cmdNew.CommandText = "SELECT PkData, CardNumberFormatted, UserName, Email, Picture FROM log_Card";
                extReader = cmdNew.ExecuteExtendedReader();

                //insert __net
                extReader.AppendRecord();
                if (reader.Read())
                {
                    for (int i = 0; i < reader.FieldCount; i++)
                    {
                        if (!reader.IsDBNull(i))
                        {
                            extReader.SetValue(i, reader.GetValue(i));
                        }
                    }
                }
                
                extReader.WriteRecord();
                extReader.Close();
                reader.Close();
            }
            catch (Exception ex)
            {
                AdsCommand errCmd = conn.CreateCommand();
                errCmd.CommandText = "INSERT INTO __error VALUES( 0, '" + ex.Message + "' )";
                errCmd.ExecuteNonQuery();
            }
            return 0;
        }

        public int procedureInsertEvent(Int32 ulConnectionID, Int32 hConnection, String strTriggerName, String strTableName,
                      Int32 ulEventType, Int32 ulTriggerType, Int32 ulRecNo)
        {
            AdsConnection conn = new AdsConnection("ConnectionHandle=" + hConnection.ToString());
            AdsCommand cmd;
            try
            {
                conn.Open();
                cmd = conn.CreateCommand();
                cmd.CommandText = "EXECUTE PROCEDURE sp_SignalEvent('evento_insert', false, 0, ::stmt.TrigRowID);";
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex) 
            {
                AdsCommand errCmd = conn.CreateCommand();
                errCmd.CommandText = "INSERT INTO __error VALUES( 0, '" + ex.Message + "' )";
                errCmd.ExecuteNonQuery();
            }
            return 0;
        }
    }
}
