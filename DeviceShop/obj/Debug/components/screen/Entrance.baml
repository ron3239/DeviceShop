   M S B A M L   `   `   `  ����E  ADeviceShop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullK*clr-namespace:DeviceShop.components.screenDeviceShop.components.screen  5      +    %DeviceShop.components.screen.Entrance   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      <local*clr-namespace:DeviceShop.components.screen     5        N� Title$  Entrance��5	      .��5      � $��10q�6    � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $��* �6   �� 5      $
��Auto �6   .+�5   
   �� $��0��6   $��Документ��6    .��5      �  � ColumnDefinitions 5      �� 5      $
��Auto �6'   �� 5      $��* �6'   �� 5      $
��Auto �6'   �� 5      $��* �6'    5      �� 5      $
��Auto �6$   �� 5      $
��Auto �6$   .+�5!      �� $��0��6   $��0��6)   $��Номер:��69   $��0,0,5,5q�6G   �� 5"      $��0��6   $��1��6'   $��0,0,0,5q�6W   ��67   �� *DocumentNumber+6W   �� 5$      $��0��6   $��2��6)   $��	Дата:��69   $��5,0,5,5q�6F   (  "System.Windows.Controls.DatePicker  5%      $��0��6   $��3��6*   {�.  $��0,0,0,5q�6r      SelectedDate 6:   �� *DocumentDate+6r   �� 5'      $��1��6   $��0��6)   $��Поставщик:��69   $��0,0,5,0q�6K   �� 5(      $��1��6   $��1��6(    �� DisplayMemberPath$
 Name��5)       �� SelectedValuePath$ Id��5*      $��0,0,0,0q�5+   H   ��5(   8   �� *	Suppliers+ �� SelectedValue 5+      �� *SelectedSupplierId+6H   �� 5-      $��1��6   $��2��6)   $��Договор:��69   $��5,0,5,0q�6I   �� 5.      $��1��6   $��3��6(   $ DisplayInfo��5/      $ Id��50      $��0,0,0,0q�51   H   ��5.   8   �� *	Contracts+ 51      �� *SelectedContractId+6H   52      53      �� 56   
   $��1��6   $��Позиции��6    $��	0,10,0,10q�61   .��57      �  58      �� 59      $
��Auto �6$   �� 5:      $��* �6$   �� 5;      $
��Auto �6$   .+�5>      �� $��0��6    �� Orientation$ 
Horizontal=�6*   .+�5?      �� $��Добавить��6   $��0,0,5,0q�6S   ��60   �� *AddItemCommand+6S   �� 5@      $��Удалить��6   ��6/   �� *RemoveItemCommand+��6U   �� *SelectedItem+5A      &   System.Windows.Controls.DataGrid  5C      $��1��6      AutoGenerateColumns .  	   CanUserAddRows	 .  ��6(   �� *Items+
 �� SelectedItem
 5D      �� *SelectedItem+   Columns 5E      4  .System.Windows.Controls.DataGridTemplateColumn  5F      ,  &System.Windows.Controls.DataGridColumn   Header$ Наименование��61      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6G      CellTemplate 5G      �� 5H   "   .R�5I   &   �� $
 Name��5J   /   $ Id��5K   /   ��5I   /   �� *!DataContext.AvailableComponents+ �� RelativeSource ��  �� AncestorType$ WindowL� 5L   /   �� *ComponentId+5M   #   5O      0  *System.Windows.Controls.DataGridTextColumn  5P      $ Количество��6-   $
 Auto 6�   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6A   �� *
Quantity+ �� UpdateSourceTrigger$ PropertyChanged=�6�     5Q      $ Ед. изм.��6-   $
 Auto 6X      
IsReadOnly .  6?   �� *Unit+6e     5R      $ Цена��6-   $
 Auto 6l    6;   �� *Price+ �� StringFormat$ {0:N2}��6l     5S      $ 
Сумма��6-   $
 Auto 6r    .  6<   �� *
TotalPrice+$ {0:N2}��6   5U      �� 5W      $��2��6   $ 
Horizontal=�6*   $��Right=�6C   .+�5X      �� $��Итого:��6    $
��Bold"�6.   $��0,0,5,0q�6@   �� 5Y      $
��Bold"�6T   $	��100��6f   $��Right=�6r   ��6    �� *TotalAmount+$ {0:N2}��6r   5Z      5[      5\      �� 5_   
   $��3��6   $ 
Horizontal=�6"   $��Right=�6;   .+�5`      �� $��Сохранить��6   $	��100��6)   $��0,0,10,0q�65   ��6G   �� *SaveCommand+�� 5a      $��Отмена��6   $	��100��6&   ��62   �� *CancelCommand+5b      5c      5d      