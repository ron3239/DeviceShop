   M S B A M L   `   `   `  ����E  ADeviceShop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullK*clr-namespace:DeviceShop.components.screenDeviceShop.components.screen  5      /    )DeviceShop.components.screen.AssemblyPage   5      W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      <local*clr-namespace:DeviceShop.components.screen     5        N� Title$  Entrance��5	      .��5      � $��10q�6    � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $��* �6   �� 5      $
��Auto �6   .+�5   
   �� $��0��6   $��Документ��6    .��5      �  � ColumnDefinitions 5      �� 5      $
��Auto �6'   �� 5      $��* �6'   �� 5      $
��Auto �6'   �� 5      $��* �6'    5      �� 5      $
��Auto �6$   �� 5      $
��Auto �6$   .+�5!      �� $��0��6   $��0��6)   $��Номер:��69   $��0,0,5,5q�6G   �� 5"      -   5         ��Name$ DocumentNumber��5"      $��0��62   $��1��6?   {�.  $��0,0,0,5q�6a   �� 5$      $��0��6   $��2��6)   $��	Дата:��69   $��5,0,5,5q�6F   (  "System.Windows.Controls.DatePicker  5%      -   5          Name$ DocumentDate��5%      $��0��63   $��3��6@   {�.  $��0,0,0,5q�6b   5(      5)      �� 5,   
   $��1��6   $��Позиции��6    $��	0,10,0,10q�61   .��5-      �  5.      �� 5/      $
��Auto �6$   �� 50      $��* �6$   �� 51      $
��Auto �6$   .+�54      �� $��0��6    �� Orientation$ 
Horizontal=�6*   .+�55      �� -   5        $��Добавить��55      $��0,0,5,0q�6L   �� 56      -   5        $��Удалить��56      6/   57      &   System.Windows.Controls.DataGrid  59      -   5          Name$ ItemsDataGrid��59      $��1��62      AutoGenerateColumns .     CanUserAddRows .  	   Columns	 5;      0  *System.Windows.Controls.DataGridTextColumn  5<      ,  &System.Windows.Controls.DataGridColumn
   Header$
 Наименование��6-      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6C      
IsReadOnly . 1  +System.Windows.Controls.DataGridBoundColumn   Binding 6M   �� *Name+6f     5=      $
 Количество��6-   $
 Auto 6�    6A   �� *
Quantity+ �� UpdateSourceTrigger$ PropertyChanged=�6�     5>      $
 Цена��6-   $
 Auto 6l    .  6;   �� *Price+ �� StringFormat$ {0:N2}��6y     5?      $
 
Сумма��6-   $
 Auto 6r    .  6<   �� *
TotalPrice+$ {0:N2}��6   5A      �� 5C      $��2��6   $ 
Horizontal=�6*   $��Right=�6C   .+�5D      �� $��Итого:��6    $
��Bold"�6.   $��0,0,5,0q�6@   �� 5E      -   5         ��Name$ TotalAmountText��5E       $
��Bold"�69   $	��100��6K   $��Right=�6W   $
��0.00��6s   5F      5G      5H      �� 5K   
   $��3��6   $ 
Horizontal=�6"   $��Right=�6;   .+�5L      �� $��Сохранить��6   $	��100��6)   $��0,0,10,0q�65   �� 5M      $��Отмена��6   $	��100��6&   5N      5O      5P      