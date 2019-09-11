# -*- coding: utf-8 -
from kivy.app import App
from kivy.lang.builder import Builder
from kivy.config import Config
from kivy.uix.label import Label
from kivy.uix.vkeyboard import VKeyboard
from kivy.core.window import Window
from kivy.properties import ObjectProperty
from kivy.uix.popup import Popup
from kivy.uix.dropdown import DropDown
from kivy.uix.screenmanager import ScreenManager, Screen
import re
from datetime import datetime
import mysql.connector
mydb=mysql.connector.connect(host="127.0.0.1", user="root", passwd="qwer@1234", database="db1")
from datetime import date

Config.set('kivy', 'keyboard_mode', 'systemanddocked')
Builder.load_file('KV/p_form.kv')
Builder.load_file('KV/p_registration.kv')
Builder.load_file('KV/p_pre_post_test.kv')


class CustomDropDown(DropDown):
    pass


class FormScreen(Screen):
    yes = ObjectProperty(True)
    no = ObjectProperty(True)

    def __init__(self, **kwargs):
        super(FormScreen, self).__init__(**kwargs)
        gender_dropdown = CustomDropDown()
        self.ids.p_gender.bind(on_release=gender_dropdown.open)
        gender_dropdown.bind(on_select=lambda instance, x: setattr(self.ids.p_gender, 'text', x))
        self.ids.p_dob.bind(on_text_validate=lambda x: self.match(self.ids.p_dob))

    def match(self, dob_field):
        dob_pattern = r'(((0[1-9]|[12][0-9]|3[01])([/])(0[13578]|10|12)([/])(\d{4}))|(([0][1-9]|[12][0-9]|30)([/])(0[469]|11)([/])(\d{4}))|((0[1-9]|1[0-9]|2[0-8])([/])(02)([/])(\d{4}))|((29)(\.|-|\/)(02)([/])([02468][048]00))|((29)([/])(02)([/])([13579][26]00))|((29)([/])(02)([/])([0-9][0-9][0][48]))|((29)([/])(02)([/])([0-9][0-9][2468][048]))|((29)([/])(02)([/])([0-9][0-9][13579][26])))'

        numbers = re.match(dob_pattern, dob_field.text)
        if numbers:
            curr_year = int(date.today().year)
            dob_year = int(self.ids.p_dob.text[6:10])
            age = str(curr_year - dob_year)
            self.ids.p_age.text = age + " Years"
        else:
            dob_pop = Popup(title="Error", size=(280, 200), size_hint=(None, None),
                            content=Label(text="Please Enter a valid Date Of Birth. \n(e.g. 01/01/1999)"))
            dob_pop.open()
            dob_field.text = ''
            self.ids.p_age.text = ''

    def submit_popup(self):
        # To get the radio button values
        if self.ids.p_smoke_yes.active:
            smoke = "Yes"
            print("smoker=" + smoke)
        else:
            smoke = "No"
            print("smoker=" + smoke)

        # To get the gender button values
        gender = self.ids.p_gender.text
        print("gender=" + gender)
        # Popups For Submit Button
        pop_sub = Popup(title="Submit", title_align="center", content=Label(text="Information Submitted Successfully"),
                        size=(300, 200),
                        size_hint=(None, None), auto_dismiss=True)

        pop_empty = Popup(title="Error", title_align="center",
                          content=Label(text="Empty Field.\nPlease Fill All Information"),
                          size=(300, 200),
                          size_hint=(None, None), auto_dismiss=True)

        pop_gender = Popup(title="Error", title_align="center",
                           content=Label(text="Please Select A Gender."),
                           size=(300, 200),
                           size_hint=(None, None), auto_dismiss=True)
        if self.ids.p_fname.text == '' or self.ids.p_height.text == '' or self.ids.p_weight.text == '' \
                or self.ids.p_dob.text == '' or self.ids.p_mname.text == '' or self.ids.p_lname.text == '':
            pop_empty.open()
        elif self.ids.p_gender.text == 'Gender':
            pop_gender.open()
        else:
            pop_sub.open()

    @staticmethod
    def exit_prog():
        App.get_running_app().stop()
        Window.close()

    @staticmethod
    def showKeyboard():
        keyboard = VKeyboard()
        return keyboard
    
    def fun(self, p_fname, p_mname, p_lname, p_height,p_weight,p_dob, p_age, p_gender, p_smoke_yes):
    
        now = datetime.now()
        formatted_date = now.strftime('%Y-%m-%d %H:%M:%S')
        
        datetime_str = p_dob
        datetime_object = datetime.strptime(datetime_str, '%d/%m/%Y').date()
        mycursor = mydb.cursor()
        sql="""insert into tb1 
               (p_fname, p_mname, p_lname, p_height,p_weight, p_dob, p_age, p_gender, p_smoker, p_registrationinfo) 
               values( %s, %s, %s, %s, %s, %s, %s, %s , %s , %s)"""
        val = (p_fname, p_mname, p_lname, p_height,p_weight, datetime_object, p_age, p_gender, p_smoke_yes , formatted_date)
        mycursor.execute(sql, val)
        mydb.commit()
        


class RegistrationScreen(Screen):
    pass


class PrePostTestScreen(Screen):
    pass


class ThisApp(App):
    def build(self):
        screen_mgr = ScreenManager()
        screen_mgr.add_widget(RegistrationScreen(name="Registration_Screen"))
        screen_mgr.add_widget(FormScreen(name="Form_Screen"))
        screen_mgr.add_widget(PrePostTestScreen(name="PrePostTest_Screen"))
        return screen_mgr


if __name__ == '__main__':
    ThisApp().run()
