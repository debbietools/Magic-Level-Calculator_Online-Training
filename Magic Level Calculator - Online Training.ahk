#SingleInstance Force
;#NoTrayIcon
#NoEnv
SendMode Input
Process, Priority, , A
SetBatchLines, -1


Gui, Show, y0 w315 h650, Tibia ML Calculator

Gui, Add, Tab2, x0 y0 w1000 h22, Magic Level - Online Training Calculator
Gui, Tab, 1

Gui, Add, Text, x10 y25, Amount of mana to recover(mage without promotion):
Gui, Add, edit, x10 y40 h17 vAmountManaToRecover Left,

Gui, Add, Text, x10 y65, Life Ring price(gps):
Gui, Add, edit, x10 y80 h17 vLifeRingPrice Left,

Gui, Add, Text, x10 y105, Ring of Healing price(gps):
Gui, Add, edit, x10 y120 h17 vRoHPrice Left,

Gui, Add, Button, x10 y145 gCALC, Calc

Gui Add, GroupBox, cBlack x10 y170 w295 h8

Gui, Add, Text, x10 y185, Time to recover(Regeneration):
Gui, Add, edit, x10 y200 h17 ReadOnly vRegenMin, %RegenMin%
Gui, Add, edit, x10 y220 h17 ReadOnly vRegenHour, %RegenHour%

Gui, Add, Text, x10 y245, Time to recover(Regen + Soft Boots):
Gui, Add, edit, x10 y260 h17 ReadOnly vRegenHourSoft, %RegenHourSoft%

Gui, Add, Text, x10 y285, Amount of Soft Boots charges:
Gui, Add, edit, x10 y300 h17 ReadOnly vAmountSoftBootsCharges, %AmountSoftBootsCharges%

Gui, Add, Text, x10 y325, Time to recover(Regen + Life Ring):
Gui, Add, edit, x10 y340 h17 ReadOnly vRegenHourLife, %RegenHourLife%

Gui, Add, Text,x10 y365, Amount of Life Ring charges:
Gui, Add, edit, x10 y380 h17 ReadOnly vAmountLifeRingCharges, %AmountLifeRingCharges%

Gui, Add, Text, x10 y405, Time to recover(Regen + Ring of Healing):
Gui, Add, edit, x10 y420 h17 ReadOnly vRegenHourRoH, %RegenHourRoH%

Gui, Add, Text, x10 y445, Amount of Ring of Healing charges:
Gui, Add, edit, x10 y460 h17 ReadOnly vAmountRoHCharges, %AmountRoHCharges%

Gui, font, bold
Gui, Add, Text, x10 y485, Total hours(Regen + Soft + Life):
Gui, Add, edit, x10 y500 h17 ReadOnly vTotalHourSoftLife, %TotalHourSoftLife%

Gui, Add, Text, x10 y525, Total hours(Regen + Soft + RoH):
Gui, Add, edit, x10 y540 h17 ReadOnly vTotalHourSoftRoH, %TotalHourSoftRoH%

Gui, Add, Text, x10 y565, Total charges price(Soft + Life)
Gui, Add, edit, x10 y580 h17 ReadOnly vTotalChargesPriceSoftLife, %TotalChargesPriceSoftLife%

Gui, Add, Text, x10 y605, Total charges price(Soft + RoH)
Gui, Add, edit, x10 y620 h17 ReadOnly vTotalChargesPriceSoftRoH, %TotalChargesPriceSoftRoH%
Gui, font, norm

Return

;=============================================================;
;=============================================================;

; CALCULATOR

CALC:
{
Gui, Submit, NoHide

setformat float, 0.1

Regen := 3 * AmountManaToRecover / 2
RegenMin := Regen / 60
RegenHour := RegenMin / 60
RegenTotal := RegenHour

RegenSoft := 3 * AmountManaToRecover / (6+2)
RegenMinSoft := RegenSoft / 60
RegenHourSoft := RegenMinSoft / 60
TotalHourSoft := RegenHourSoft

RegenLife := 3 * AmountManaToRecover / (4+2)
RegenMinLife := RegenLife / 60
RegenHourLife := RegenMinLife / 60
TotalHourLife := RegenHourLife

RegenRoH := 3 * AmountManaToRecover / (12+2)
RegenMinRoH := RegenRoH / 60
RegenHourRoH := RegenMinRoH / 60
TotalHourRoH := RegenHourRoH

RegenSoftLife := 3 * AmountManaToRecover / (2+6+4)
RegenMinSoftLife := RegenSoftLife / 60
RegenHourSoftLife := RegenMinSoftLife / 60
TotalHourSoftLife := RegenHourSoftLife

RegenSoftRoH := 3 * AmountManaToRecover / (2+6+12)
RegenMinSoftRoH := RegenSoftRoH / 60
RegenHourSoftRoH := RegenMinSoftRoH / 60
TotalHourSoftRoH := RegenHourSoftRoH

setformat float, 0

AmountSoftBootsCharges := RegenHourSoft / 4
AmountRoHCharges := (RegenHourRoH / 0.125)
AmountLifeRingCharges := (RegenHourLife / 0.333)

CostCharges := AmountSoftBootsCharges * 10

CostLifeCharges := (AmountLifeRingCharges*LifeRingPrice)
CostLifeCharges := CostLifeCharges / 1000

CostRoHCharges := (AmountRoHCharges*RoHPrice)
CostRoHCharges := CostRoHCharges / 1000

TotalChargesPriceSoftLife := CostCharges + CostLifeCharges
TotalChargesPriceSoftRoH := CostCharges + CostRoHCharges

GuiControl,, RegenMin, %RegenMin% Minutes
GuiControl,, RegenHour, %RegenHour% Hours

GuiControl,, RegenMinSoft, %RegenMinSoft% Minutes
GuiControl,, RegenHourSoft, %RegenHourSoft% Hours
GuiControl,, TotalHourSoft, %TotalHourSoft% Hours
GuiControl,, AmountSoftBootsCharges, %AmountSoftBootsCharges% charges = %CostCharges%k

GuiControl,, RegenMinLife, %RegenMinLife% Minutes
GuiControl,, RegenHourLife, %RegenHourLife% Hours
GuiControl,, TotalHourLife, %TotalHourLife% Hours
GuiControl,, AmountLifeRingCharges, %AmountLifeRingCharges% charges = %CostLifeCharges%k

GuiControl,, RegenMinRoH, %RegenMinRoH% Minutes
GuiControl,, RegenHourRoH, %RegenHourRoH% Hours
GuiControl,, TotalHourRoH, %TotalHourRoH% Hours
GuiControl,, AmountRoHCharges, %AmountRoHCharges% charges = %CostRoHCharges%k

GuiControl,, TotalChargesPriceSoftLife, %TotalChargesPriceSoftLife%k
GuiControl,, TotalChargesPriceSoftRoH, %TotalChargesPriceSoftRoH%k

GuiControl,, TotalHourSoftLife, %TotalHourSoftLife% Hours
GuiControl,, TotalHourSoftRoH, %TotalHourSoftRoH% Hours

}
Return