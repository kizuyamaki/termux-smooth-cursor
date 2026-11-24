# termux-smooth-cursor

เคอร์เซอร์สมูทมีหางลากตามสำหรับ Termux ติดตั้งด้วยคำสั่งเดียว **ไม่ต้องลง APK ใหม่ ไม่แก้ตัวแอป Termux**
ลบออกแล้ว Termux กลับมาเป็นแบบเดิมทุกอย่าง

A smooth, trailing cursor for Termux. One-line install, **no APK, Termux itself is untouched**.
Remove it and everything is back to stock.

## ติดตั้ง / Install

```sh
curl -fsSL https://raw.githubusercontent.com/kizuyamaki/termux-smooth-cursor/main/install.sh | sh
```

ตัวติดตั้งจะลง: `python`, `curl`, ไลบรารี `pyte` (ผ่าน pip) และตัวโปรแกรม `smoothcursor`

## เปิดใช้ / Use

```sh
smoothcursor
```

จะเข้า shell ใหม่ที่มีเคอร์เซอร์สมูท ออกด้วย `exit` แล้วกลับมาเป็นแบบปกติ

ให้เปิดอัตโนมัติทุก session:

```sh
smoothcursor autostart on
```

ปิดอัตโนมัติ:

```sh
smoothcursor autostart off
```

## ปรับแต่ง / Customize

```sh
smoothcursor set speed 40
```

```sh
smoothcursor set color '#ff88cc'
```

```sh
smoothcursor set enabled false
```

| key | ค่า | ความหมาย |
|---|---|---|
| speed | 10-500 | มิลลิวินาที ยิ่งน้อยยิ่งเร็ว (ค่าเริ่มต้น 60) |
| color | `#rrggbb` | สีของหาง |
| enabled | true / false | เปิดปิดเอฟเฟกต์ |

ค่าใหม่มีผลกับ session ใหม่ ไฟล์ตั้งค่าอยู่ที่ `~/.termux/smooth-cursor.conf`

## ถอนการติดตั้ง / Uninstall

```sh
smoothcursor uninstall
```

ลบโปรแกรม ไฟล์ตั้งค่า และบรรทัดเปิดอัตโนมัติออกทั้งหมด (ถ้าอยากลบ pyte ด้วย: `pip uninstall pyte`)

## ถ้าเปิดอัตโนมัติแล้วมีปัญหา / Emergency off

```sh
touch ~/.termux/smooth-cursor.off
```

คำสั่งนี้ปิดการเปิดอัตโนมัติทันทีโดยไม่ต้องแก้ไฟล์อื่น (ถ้าระบบเปิด shell ซ้อน พิมพ์ `exit` หนึ่งครั้งก็กลับมาเป็นแบบปกติ)

## วิธีทำงาน / How it works

โปรแกรมคั่นอยู่ระหว่าง Termux กับ shell คอยจับตำแหน่งเคอร์เซอร์ แล้ววาดหางสีตามหลังด้วย
escape code ธรรมดา และลบหางก่อนที่โปรแกรมจะวาดอะไรใหม่ เพื่อไม่ให้หน้าจอเพี้ยน

ข้อจำกัด: หางลากทีละช่องตัวอักษร (ไม่ละเอียดแบบ pixel) และอาจกะพริบเล็กน้อยบางเครื่อง

License: MIT
