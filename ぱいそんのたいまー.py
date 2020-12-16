#ぱいそんのたいまー
import datetime
import tkinter
import math

root = tkinter.Tk()
root.title("netaたいま")
root.geometry("300x300")

ibe='ぷろせか'
s = '2020-12-10T15:00:00+09:00'
ss = '2020-12-18T12:00:00Z'
timefm='%Y/%m/%d %H:%M'


s=s.replace('Z', '+00:00')
ss=ss.replace('Z', '+00:00')

now = datetime.datetime.now()
st  = datetime.datetime.fromisoformat(s)
en  = datetime.datetime.fromisoformat(ss)


tm = now.strftime(timefm)

tmp=st.timestamp()
st=datetime.datetime.fromtimestamp(tmp)
ts = st.strftime(timefm)

#utcをJSTに変換　エポック秒にして再変換
tmp=en.timestamp()
en=datetime.datetime.fromtimestamp(tmp)
te = en.strftime(timefm)

span= abs(en-st)
elapsed= abs(now-st)
left= abs(en-now)

# <class 'datetime.timedelta'>
x = abs(now-st)/abs(en-st)*100
n = 2  
y = math.floor(x * 10 ** n) / (10 ** n)
progress = y


# ラベルの作成
labelt = tkinter.Label(root, text=ibe)
label = tkinter.Label(root, text=tm)
label2 = tkinter.Label(root, text=ts)
label3 = tkinter.Label(root, text=te)
label4 = tkinter.Label(root, text=span)
label5 = tkinter.Label(root, text=elapsed)
label6 = tkinter.Label(root, text=left)
label7 = tkinter.Label(root, text=progress)

#ラベルの表示
labelt.grid()
label.grid()
label2.grid()
label3.grid()
label4.grid()
label5.grid()
label6.grid()
label7.grid()


root.mainloop()