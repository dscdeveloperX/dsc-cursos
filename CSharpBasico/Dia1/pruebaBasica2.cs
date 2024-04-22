using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CSharpBasico.Dia1
{
    public partial class pruebaBasica2 : Form
    {
        public pruebaBasica2()
        {
            InitializeComponent();
        }

        

        private void btnSuma_Click(object sender, EventArgs e)
        {
            lblSintesis.Text = (decimal.Parse(tbxValor1.Text) + decimal.Parse(tbxValor2.Text)).ToString();
        }

        private void btnResta_Click(object sender, EventArgs e)
        {
            lblSintesis.Text = (decimal.Parse(tbxValor1.Text) - decimal.Parse(tbxValor2.Text)).ToString();
        }

        private void btnMultiplicate_Click(object sender, EventArgs e)
        {
            lblSintesis.Text = (decimal.Parse(tbxValor1.Text) * decimal.Parse(tbxValor2.Text)).ToString();
        }

        private void btnDividir_Click(object sender, EventArgs e)
        {
            lblSintesis.Text = (decimal.Parse(tbxValor1.Text) / decimal.Parse(tbxValor2.Text)).ToString();
        }
    }
}
