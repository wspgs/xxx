local GuiService = gethui and gethui() or game:GetService("CoreGui")

local dict = {
    -- 🌟 แท็บหลัก & ทั่วไป
    ["Info"] = "ℹ️ ข้อมูล", ["Farm"] = "🚜 ฟาร์ม", ["Shops"] = "🛒 ร้านค้า", ["Player"] = "🏃 ตัวละคร", ["Settings"] = "⚙️ ตั้งค่า",
    ["Selected Seeds"] = "เมล็ดที่เลือกไว้", ["Buy All"] = "ซื้อทั้งหมด", ["Copy Discord Invite"] = "คัดลอกลิงก์ Discord",
    
    -- 🌟 หน้า Info (ข้อมูล)
    ["Discord"] = "ดิสคอร์ด", ["Join Discord to Make Money"] = "เข้าดิสคอร์ดเพื่อรับข่าวสาร", ["Join Discord for Keyless Scripts"] = "เข้าดิสคอร์ดเพื่อสคริปต์ฟรีไม่ต้องใช้คีย์",
    ["Account"] = "👤 บัญชีผู้ใช้", ["Game Info"] = "🎮 ข้อมูลของเกม", ["Copy join script (Job ID)"] = "คัดลอกสคริปต์เข้าเซิร์ฟเวอร์",
    ["Scripts"] = "📦 สคริปต์", ["Included in this hub"] = "สคริปต์ที่รวมอยู่ในฮับนี้", ["Features"] = "📋 ฟีเจอร์การใช้งาน",
    ["Socials"] = "🌐 ช่องทางการติดต่อ", ["Donations"] = "❤️ สนับสนุนผู้สร้าง", ["Copy Litecoin Address"] = "คัดลอกที่อยู่กระเป๋า Litecoin",

    -- 🌟 หน้า เมล็ดพันธุ์ (Seeds)
    ["Auto Buy Seeds"] = "ออโต้ซื้อเมล็ด", ["Buy Mode"] = "โหมดการซื้อ", ["Minimum Rarity"] = "ความหายากขั้นต่ำ",
    ["Seeds To Buy"] = "เมล็ดที่ต้องการซื้อ", ["Only Mutated Seeds"] = "ซื้อเฉพาะเมล็ดกลายพันธุ์",
    ["Auto Buy Furniture"] = "ออโต้ซื้อเฟอร์นิเจอร์", ["Furniture To Buy"] = "เฟอร์นิเจอร์ที่จะซื้อ",
    ["Limits"] = "ตั้งค่าขีดจำกัด", ["Max Cost Per Seed (0 = off)"] = "ราคาแพงสุดที่รับได้ (0 = ปิด)",
    ["Keep Coin Reserve"] = "เก็บเงินสำรองไว้ (ห้ามใช้หมด)", ["Notify On Buy"] = "แจ้งเตือนเมื่อซื้อสำเร็จ",
    ["Buy Delay"] = "หน่วงเวลาตอนซื้อ (ลดแลค)", ["Loop Delay"] = "หน่วงเวลาวนลูป",
    ["Compost"] = "ระบบทำปุ๋ยหมัก", ["Auto Compost Seeds"] = "ออโต้ย่อยเมล็ดทำปุ๋ย", ["Seed Rarity"] = "ความหายากของเมล็ดที่จะย่อย",

    -- 🌟 หน้า Farm (ฟาร์ม)
    ["Auto Harvest"] = "ออโต้เก็บเกี่ยว", ["Harvest At Multiplier"] = "เก็บเกี่ยวเมื่อตัวคูณถึง",
    ["Auto Collect Dead Tree"] = "ออโต้เก็บต้นไม้ตาย", ["Notify On Harvest"] = "แจ้งเตือนเมื่อเก็บเกี่ยว",
    ["Auto Collect Fruit"] = "ออโต้เก็บผลไม้", ["Teleport To Each Tree"] = "วาร์ปไปเก็บต้นไม้แต่ละต้น",
    ["Blacklisted Trees"] = "รายชื่อต้นไม้ที่ยกเว้น (ไม่เก็บ)", ["Use Collect All (ignored while blacklisted)"] = "ใช้ระบบเก็บทั้งหมด (ข้ามต้นที่ยกเว้น)",
    ["Collect Delay"] = "หน่วงเวลาตอนเก็บ", ["Auto Plant"] = "ออโต้ปลูก", ["Seed Choice"] = "รูปแบบการเลือกเมล็ด",
    ["Any Seed"] = "เมล็ดอะไรก็ได้", ["Seeds To Plant"] = "เมล็ดที่ต้องการปลูก", ["Fertilizer"] = "ปุ๋ย (Fertilizer)",
    ["Only Plant During Weather"] = "ปลูกเฉพาะสภาพอากาศที่กำหนด", ["Weathers To Plant In"] = "สภาพอากาศที่ต้องการปลูก",
    ["Auto Plant Grown Trees"] = "ออโต้ปลูกต้นไม้ที่โตแล้ว", ["Auto Organise Trees"] = "ออโต้จัดระเบียบต้นไม้",
    ["Tree Placement"] = "รูปแบบการวางต้นไม้", ["Grid"] = "แบบตาราง (Grid)", ["Set Tree Spot To My Position"] = "ตั้งจุดวางต้นไม้ที่ฉันยืนอยู่",
    ["Visualize Placement"] = "แสดงภาพจำลองจุดวาง", ["Notify On Plant"] = "แจ้งเตือนเมื่อปลูกสำเร็จ", ["Auto Sell"] = "ออโต้ขายของ",

    -- 🌟 หน้า Shops (ร้านค้า)
    ["Auto Buy Pet Eggs"] = "ออโต้ซื้อไข่สัตว์เลี้ยง", ["Eggs"] = "ประเภทไข่", ["Common (100 tickets)"] = "ไข่ธรรมดา (100 ทิคเก็ต)",
    ["Keep Ticket Reserve"] = "เก็บตั๋วสำรองไว้ (ห้ามใช้หมด)", ["Auto Buy Worms"] = "ออโต้ซื้อหนอน", ["Auto Buy Gear"] = "ออโต้ซื้ออุปกรณ์ (Gear)",
    ["Farmers Market"] = "ตลาดชาวไร่ (Farmers Market)", ["Auto Give Market Fruits"] = "ออโต้ส่งผลไม้เข้าตลาด", ["Auto Claim Market"] = "ออโต้รับของจากตลาด",
    ["Ticket Rows"] = "แถวตั๋ว (Ticket Rows)", ["Easy Regular (25 tickets)"] = "แถวธรรมดา (25 ทิคเก็ต)", ["Auto Feed Pets"] = "ออโต้อาหารสัตว์เลี้ยง",
    ["Feed Below Fullness %"] = "ให้อาหารเมื่อความอิ่มต่ำกว่า %",

    -- 🌟 หน้า Player (ตัวละคร)
    ["Fly"] = "✈️ บิน", ["Fly Speed"] = "ความเร็วบิน", ["Movement"] = "🏃 การเคลื่อนไหว",
    ["WalkSpeed"] = "เปิดวิ่งเร็ว", ["WalkSpeed Amount"] = "ระดับความเร็ววิ่ง", ["Infinite Jump"] = "กระโดดรัวๆ (กลางอากาศ)",
    ["NoClip"] = "เดินทะลุกำแพง", ["No Gameplay Paused"] = "ป้องกันเกมหยุดทำงาน", ["Optimization"] = "🛠️ ลดแลค / ปรับสเปค",
    ["Remove Other Players' Trees"] = "ลบล้างต้นไม้ของผู้เล่นอื่น", ["Remove Other Players' Fruit"] = "ลบล้างผลไม้ของผู้เล่นอื่น",
    ["Inventory"] = "🎒 กระเป๋าไอเทม", ["Auto Equip Item"] = "ออโต้สวมใส่ไอเทม", ["Items To Equip"] = "ไอเทมที่ต้องการใส่",

    -- 🌟 หน้า Settings (ตั้งค่า + Config + Theme)
    ["Menu"] = "เมนู (Menu)", ["Menu bind"] = "ปุ่มเปิด/ปิดเมนู", ["Anti-AFK"] = "ป้องกันเกมเด้ง (Anti-AFK)", ["Unload"] = "ปิดสคริปต์ (Unload)",
    ["Themes"] = "ธีม (Themes)", ["Theme list"] = "รายชื่อธีม", ["Set as default"] = "ตั้งเป็นค่าเริ่มต้น", ["Custom theme name"] = "ชื่อธีมสร้างเอง",
    ["Create theme"] = "สร้างธีม", ["Custom themes"] = "ธีมสร้างเอง", ["Load theme"] = "โหลดธีม", ["Overwrite theme"] = "บันทึกทับธีม",
    ["Delete theme"] = "ลบธีม", ["Refresh list"] = "รีเฟรชรายชื่อ", ["Reset default"] = "รีเซ็ตค่าเริ่มต้น", ["Theme JSON"] = "โค้ด Theme JSON",
    ["Import theme"] = "นำเข้าธีม", ["Export current theme"] = "ส่งออกธีมปัจจุบัน", ["Configuration"] = "การตั้งค่า (Config)",
    ["Config name"] = "ชื่อ Config", ["Create config"] = "สร้าง Config", ["Config list"] = "รายชื่อ Config", ["Load config"] = "โหลด Config",
    ["Overwrite config"] = "บันทึกทับ Config", ["Delete config"] = "ลบ Config", ["Set as autoload"] = "ตั้งเป็นโหลดออโต้", ["Reset autoload"] = "รีเซ็ตโหลดออโต้",
    ["Config JSON"] = "โค้ด Config JSON", ["Import config"] = "นำเข้า Config", ["Export current config"] = "ส่งออก Config ปัจจุบัน",
    ["Paste exported config here"] = "วางโค้ด Config ที่ส่งออกไว้ตรงนี้", ["Export Config to Clipboard"] = "คัดลอก Config", ["Import Config from Clipboard Text"] = "นำเข้า Config จากที่คัดลอกไว้",
    ["Background color"] = "สีพื้นหลัง", ["Main color"] = "สีหลัก", ["Accent color"] = "สีรอง", ["Outline color"] = "สีขอบ",
    ["Font color"] = "สีตัวหนังสือ", ["Font Face"] = "รูปแบบฟอนต์", ["Background Image"] = "รูปภาพพื้นหลัง",

    -- 🌟 รายชื่อเมล็ดพันธุ์ทั้งหมด (ครบชุด)
    ["Select All"] = "✅ เลือกทั้งหมด", ["Deselect All"] = "❌ ยกเลิกทั้งหมด",
    ["Apple Seed ($200)"] = "แอปเปิ้ล ($200)", ["Astral Seed ($7.50e+42)"] = "แอสทรัล ($7.50e+42)",
    ["Avocado Seed ($20K)"] = "อะโวคาโด ($20K)", ["Banana Seed ($3B)"] = "กล้วย ($3B)",
    ["Blooming Seed ($750B)"] = "บลูมมิ่ง ($750B)", ["Cherry Seed ($2.5M)"] = "เชอร์รี่ ($2.5M)",
    ["Coconut Seed ($10M)"] = "มะพร้าว ($10M)", ["Diamond Seed ($1Qi)"] = "เพชร ($1Qi)",
    ["Dragon Fruit Seed ($7B)"] = "แก้วมังกร ($7B)", ["Elder Seed ($5Oc)"] = "เอลเดอร์ ($5Oc)",
    ["Fig Seed ($50O)"] = "มะเดื่อ ($50O)", ["Glowing Seed ($500B)"] = "เรืองแสง ($500B)",
    ["Glowshroom Seed ($3.5Oc)"] = "เห็ดเรืองแสง ($3.5Oc)", ["Inferno Seed ($3.5De)"] = "อินเฟอร์โน ($3.5De)",
    ["Lemon Seed ($15K)"] = "เลมอน ($15K)", ["Magic Seed ($500T)"] = "เวทมนตร์ ($500T)", 
    ["Mango Seed ($5M)"] = "มะม่วง ($5M)", ["Oak Seed (Free)"] = "โอ๊ค (ฟรี)",
    ["Orange Seed ($10K)"] = "ส้ม ($10K)", ["Peach Seed ($350)"] = "พีช ($350)",
    ["Pine Seed ($25)"] = "สน ($25)", ["Pizza Seed ($850T)"] = "พิซซ่า ($850T)",
    ["Prismatic Seed ($5.00e+42)"] = "ปริซึม ($5.00e+42)", ["Spirit Seed ($5De)"] = "วิญญาณ ($5De)",
    ["Starfruit Seed ($4.5B)"] = "มะเฟือง ($4.5B)", ["Void Seed ($1.75Qi)"] = "วอยด์/ความว่างเปล่า ($1.75Qi)"
}

local lowerDict = {}
for k, v in pairs(dict) do
    lowerDict[k:lower()] = v
end

-- ⚙️ ระบบ Smart Match: แปลข้อความที่มีตัวแปร (เช่น ชื่อผู้ใช้, ไอดีแมพ)
local function translateDynamicText(txt)
    local newTxt = txt
    -- หมวด Settings
    newTxt = newTxt:gsub("^Current default theme:", "ธีมเริ่มต้นปัจจุบัน:")
    newTxt = newTxt:gsub("^Current autoload config:", "Config โหลดออโต้ปัจจุบัน:")
    newTxt = newTxt:gsub("^Contrast check:", "ระบบเช็คสี (Contrast):")
    
    -- หมวด Info (ข้อมูลที่เปลี่ยนไปตามผู้เล่น)
    newTxt = newTxt:gsub("^User %- (.*)", "ผู้ใช้ - %1")
    newTxt = newTxt:gsub("^Status %- (.*)", "สถานะ - %1")
    newTxt = newTxt:gsub("^Executor %- (.*)", "ตัวรันสคริปต์ - %1")
    newTxt = newTxt:gsub("^Place ID %- (.*)", "รหัสแมพ - %1")
    newTxt = newTxt:gsub("^Server %- (.*)", "เซิร์ฟเวอร์ - %1")
    
    return newTxt
end

-- ⚙️ ฟังก์ชันแปลภาษา
local function translateText(obj)
    pcall(function()
        if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
            local currentText = obj.Text
            
            -- 1. เช็ค Smart Match ก่อน
            local dynText = translateDynamicText(currentText)
            if dynText ~= currentText then
                obj.Text = dynText
                currentText = dynText
            end

            -- 2. แปลงเป็นพิมพ์เล็กและลบแท็กโค้ดสีออก เพื่อเทียบกับพจนานุกรม
            local cleanText = currentText:gsub("<[^>]+>", ""):match("^%s*(.-)%s*$"):lower()
            if lowerDict[cleanText] then
                obj.Text = lowerDict[cleanText]
            end
            
            -- 3. แปล Placeholder (ช่องพิมพ์)
            if obj:IsA("TextBox") then
                local currentPlaceholder = obj.PlaceholderText
                local cleanPlaceholder = currentPlaceholder:gsub("<[^>]+>", ""):match("^%s*(.-)%s*$"):lower()
                if lowerDict[cleanPlaceholder] then
                    obj.PlaceholderText = lowerDict[cleanPlaceholder]
                end
            end
        end
    end)
end

-- ⚙️ ฝังระบบแปลตลอดเวลา
local function hookObject(obj)
    translateText(obj)
    pcall(function()
        if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
            if not obj:GetAttribute("Hooked_TH_V4") then
                obj:SetAttribute("Hooked_TH_V4", true)
                obj:GetPropertyChangedSignal("Text"):Connect(function()
                    translateText(obj)
                end)
            end
        end
    end)
end

-- สแกนเมนูที่มีอยู่
for _, obj in pairs(GuiService:GetDescendants()) do
    hookObject(obj)
end

-- สแกนเมนูที่เกิดใหม่ (เช่น ดรอปดาวน์)
GuiService.DescendantAdded:Connect(function(obj)
    task.wait(0.01)
    hookObject(obj)
end)

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "🇹🇭 V.4 Smart AI ทำงาน!",
    Text = "แปลข้อความอัตโนมัติ และเพิ่มชื่อเมล็ดครบแล้ว!",
    Duration = 5
})
