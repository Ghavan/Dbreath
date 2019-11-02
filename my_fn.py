from datetime import datetime
from datetime import date
import mysql.connector
from kivy.uix.popup import Popup
from kivy.uix.label import Label
import re

mydb=mysql.connector.connect(host="127.0.0.1", user="root", passwd="qwer@1234", database="db1")
mycursor = mydb.cursor()


# global fun
def fun(p_fname, p_mname, p_lname, p_height, p_weight, p_dob,smoke, gender, age):
    now = datetime.now()
    formatted_date = now.strftime('%Y-%m-%d %H:%M:%S')

    datetime_str = p_dob.text
    datetime_object = datetime.strptime(datetime_str, '%d/%m/%Y').date()

    sql = "INSERT INTO patient_mst (p_fname, p_mname, p_lname, p_height, p_weight, p_dob, p_age, p_gender, p_smoker, p_registrationinfo) VALUE( %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
    val = (p_fname.text, p_mname.text, p_lname.text, p_height.text, p_weight.text, datetime_object, age, gender, smoke, formatted_date)
    mycursor.execute(sql, val)
    mydb.commit()
    print('Submitted')


# global match
def match(dob_field, p_age):
    global age
    dob_pattern = r'(((0[1-9]|[12][0-9]|3[01])([/])(0[13578]|10|12)([/])(\d{4}))|(([0][1-9]|[12][0-9]|30)([/])(0[469]|11)([/])(\d{4}))|((0[1-9]|1[0-9]|2[0-8])([/])(02)([/])(\d{4}))|((29)(\.|-|\/)(02)([/])([02468][048]00))|((29)([/])(02)([/])([13579][26]00))|((29)([/])(02)([/])([0-9][0-9][0][48]))|((29)([/])(02)([/])([0-9][0-9][2468][048]))|((29)([/])(02)([/])([0-9][0-9][13579][26])))'

    numbers = re.match(dob_pattern, dob_field)
    if numbers:
        print("if")
        curr_year = int(date.today().year)
        dob_year = int(dob_field[6:10])
        age = str(curr_year - dob_year)
        p_age = age + " Years"
    else:
        print("else")
        dob_pop = Popup(title="Error", size=(280, 200), size_hint=(None, None),
                        content=Label(text="Please Enter a valid Date Of Birth. \n(e.g. 01/01/1999)"))
        # dob_pop.open()
        dob_field = ''
        p_age = ''


def count_pid():
    mycursor.execute("SELECT count(p_id) FROM patient_mst ")
    myresult = mycursor.fetchone()
    for x in myresult:
        # p_id = str(x+1)
        return str(x + 1)


# global fetch_info
def fetch_info(self, pa_fname, pa_lname, pa_id=None):
    print(pa_fname, pa_id, pa_lname)
    print(self.ids.p_id.text)
    self.ids.p1_id.text = ''
    self.ids.p1_name.text = ''
    self.ids.p1_gender.text = ''
    self.ids.p2_id.text = ''
    self.ids.p2_name.text = ''
    self.ids.p2_gender.text = ''
    self.ids.p3_id.text = ''
    self.ids.p3_name.text = ''
    self.ids.p3_gender.text = ''

    def print_it(patient_id):
        print("Hello")
        self.ids.p_id.text = patient_id

    if pa_id != '':

        sql = "select p_id , concat_ws(' ',p_fname,p_mname,p_lname) ,p_gender from patient_mst where p_id = %s and p_fname = %s and p_lname = %s"
        val = (pa_id, pa_fname, pa_lname)
        mycursor.execute(sql, val)
        myresult = mycursor.fetchall()
        for x in myresult:
            print(x)
            p1_id = str(x[0])
            p1_name = str(x[1])
            p1_gender = str(x[2])
            self.ids.p1_id.text = p1_id
            self.ids.p1_gender.text = p1_gender
            self.ids.p1_name.text = p1_name
            self.ids.p1_name.bind(on_press=lambda v: print_it(p1_id))
            print(self.ids.p_id.text)
        mydb.commit()
    else:

        sql = "select p_id , concat_ws(' ',p_fname,p_mname,p_lname) ,p_gender from patient_mst where p_fname = %s and p_lname = %s"
        val = (pa_fname, pa_lname)
        mycursor.execute(sql, val)
        myresult = mycursor.fetchall()
        pa_id = []
        pa_name = []
        pa_gender = []
        i = 0

        for x in myresult:
            pa_id.append(str(x[0]))
            pa_name.append(str(x[1]))
            pa_gender.append(str(x[2]))
            i = i + 1

        if i == 0:
            print("error")
        elif i == 1:
            self.ids.p1_id.text = pa_id[0]
            self.ids.p1_name.text = pa_name[0]
            self.ids.p1_gender.text = pa_gender[0]
            self.ids.p1_name.bind(on_press=lambda v: print_it(pa_id[0]))
        elif i <= 2:
            self.ids.p1_id.text = pa_id[0]
            self.ids.p1_name.text = pa_name[0]
            self.ids.p1_gender.text = pa_gender[0]
            self.ids.p2_id.text = pa_id[1]
            self.ids.p2_name.text = pa_name[1]
            self.ids.p2_gender.text = pa_gender[1]
            self.ids.p1_name.bind(on_press=lambda v: print_it(pa_id[0]))
            self.ids.p2_name.bind(on_press=lambda v: print_it(pa_id[1]))
        elif i > 2:
            self.ids.p1_id.text = pa_id[0]
            self.ids.p1_name.text = pa_name[0]
            self.ids.p1_gender.text = pa_gender[0]
            self.ids.p2_id.text = pa_id[1]
            self.ids.p2_name.text = pa_name[1]
            self.ids.p2_gender.text = pa_gender[1]
            self.ids.p3_id.text = pa_id[2]
            self.ids.p3_name.text = pa_name[2]
            self.ids.p3_gender.text = pa_gender[2]
            self.ids.p1_name.bind(on_press=lambda v: print_it(pa_id[0]))
            self.ids.p2_name.bind(on_press=lambda v: print_it(pa_id[1]))
            self.ids.p3_name.bind(on_press=lambda v: print_it(pa_id[2]))
        mydb.commit()


def test_info(patientid,pr_fev1_avg, pr_fvc_avg, pr_fev1_fvc_avg, pr_fet_avg, pr_pvf_avg, pr_fef25_avg, pr_fef_50_75_avg, post_fev1_avg, post_fvc_avg, post_fev1_fvc_avg, post_fet_avg, post_pvf_avg, post_fef25_avg, post_fef_50_75_avg):    
    
    pid=patientid
    now = datetime.now()
    formatted_date = now.strftime('%Y-%m-%d %H:%M:%S')
    
    sql = "INSERT INTO t_tx (p_id, p_registration, PRE_FEV1, PRE_FVC, PRE_FEV1_FVC, PRE_FET, PRE_PVF, PRE_FEF25, PRE_FEF50_75, P_50_75_avg, post_fev1_avg, post_fvc_avg, post_fev1_fvc_avg, post_fet_avg, post_pvf_avg, post_fef25_avg, post_fef_50_75_avg) VALUES (%s, %s, %s, %s, %s, %s, %s, %s,%s,%s,%s,%s,%s,%s,%s,%s)"
    val = (pid, formatted_date, pr_fev1_avg, pr_fvc_avg, pr_fev1_fvc_avg, pr_fet_avg, pr_pvf_avg, pr_fef25_avg, pr_fef_50_75_avg, post_fev1_avg, post_fvc_avg, post_fev1_fvc_avg, post_fet_avg, post_pvf_avg, post_fef25_avg, post_fef_50_75_avg)
    mycursor.execute(sql, val)
    mydb.commit()
     
def improvement_info(self, patientid):
    rtxid=''
    now = datetime.now()
    formatted_date = now.strftime('%Y-%m-%d %H:%M:%S')
    pid = patientid
    cursor = mydb.cursor(buffered=True)
    sql ="select PRE_FEV1, POST_FEV1  from t_tx where p_id like %s order by p_registration desc "
    val=(pid,)
    cursor.execute(sql,val)
    myresult = cursor.fetchmany(2)
    
    pre = []
    post = []
    for x in myresult:
        pre.append(str(x[0]))
        post.append(str(x[1]))  
    #print(round(((int(pre[0])-int(pre[1])))/int(pre[1])*100,2))
    #print(round(((int(post[0])-int(post[1])))/int(post[1])*100,2))
    x=round(((int(pre[0])-int(pre[1])))/int(pre[1])*100,2)
    y=round(((int(pre[0])-int(pre[1])))/int(pre[1])*100,2)
    avg = (x+y)/2
    #avg is percentage improvement
       
    mydb1 = mysql.connector.connect(host="127.0.0.1", user="root", passwd="qwer@1234", database="db1")
    mycursor1 = mydb1.cursor()
    mycursor1.execute("select count(p_id) from t_tx  where p_id like %s group by p_id", ("%" + str(pid) + "%",))
    myresult = mycursor1.fetchall()
    for x in myresult:
        rtxid=x[0]
       
    mydb2 = mysql.connector.connect(host="127.0.0.1", user="root", passwd="qwer@1234", database="db1")
    mycursor2 = mydb2.cursor()
    sql = "insert into impr (p_id, improvement_date, percentage_improvement, reference_tnxid) values (%s, %s, %s, %s)"
    val = ('1', formatted_date, avg, rtxid)
    mycursor2.execute(sql, val)
    return str(avg)
    mydb2.commit()
    #calling on initializtion of COPD screen...i.e. used in home screen kv file
    
    
def drug_name_l1(self, stgid):
    stageid = stgid
    sql="select d_name,d_description, d_quantity, d_duration from drug_master d where d_id in (select drug_id from sttr_drug_map where level_id like %s and sttr_map_id in (select sttr_map_id from stage_trtmnt_map where stage_id like %s and trtmnt_id = 2))"
    val =(1, stageid,)
    mycursor.execute(sql,val)
    myresult = mycursor.fetchall()    
    level1 = []
    for x in myresult:
        for i in x:
            level1.append(i)   
    print(level1) 
    #calling on COPD screen "PRESCRIPTION"

def drug_name_l2(self, stgid):
    stageid = stgid
    sql = "select d_name,d_description, d_quantity, d_duration from drug_master d where d_id in (select drug_id from sttr_drug_map where level_id like %s and sttr_map_id in (select sttr_map_id from stage_trtmnt_map where stage_id like %s and trtmnt_id = 2))"
    val = (2, stageid,)
    mycursor.execute(sql,val)
    myresult = mycursor.fetchall()
    level2 = []
    for x in myresult:
        for i in x:
            level2.append(i)     
    print(level2) 
    #calling on COPD screen "Report"    
    
def trtmnt_name(self, stgid):
    satgeid= stgid
    sql = "select trtmnt_name from treatment_mst t where trtmnt_id in (select trtmnt_id from stage_trtmnt_map where stage_id like %s)"
    val = (satgeid,)
    mycursor.execute(sql, val)
    myresult = mycursor.fetchall()
    treatment_options = []
    for x in myresult:
        treatment_options.append(x[0]) 
    print(treatment_options)
    #calling on COD screen "TREATMENT OPTIONS"


