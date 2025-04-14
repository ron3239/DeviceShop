using System.ComponentModel;

public class EntranceItem : INotifyPropertyChanged
{
    private int _quantity;
    private decimal _price;
    private decimal _totalPrice;

    public int ComponentId { get; set; }
    public string Name { get; set; }
    public string Unit { get; set; }

    public int Quantity
    {
        get => _quantity;
        set
        {
            if (_quantity != value)
            {
                _quantity = value;
                OnPropertyChanged(nameof(Quantity));
                UpdateTotalPrice();
            }
        }
    }

    public decimal Price
    {
        get => _price;
        set
        {
            if (_price != value)
            {
                _price = value;
                OnPropertyChanged(nameof(Price));
                UpdateTotalPrice();
            }
        }
    }

    public decimal TotalPrice
    {
        get => _totalPrice;
        set
        {
            if (_totalPrice != value)
            {
                _totalPrice = value;
                OnPropertyChanged(nameof(TotalPrice));
            }
        }
    }

    private void UpdateTotalPrice()
    {
        TotalPrice = Quantity * Price;
    }

    public event PropertyChangedEventHandler PropertyChanged;

    protected virtual void OnPropertyChanged(string propertyName)
    {
        PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
    }
}