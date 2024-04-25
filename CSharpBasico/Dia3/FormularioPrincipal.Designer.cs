
namespace CSharpBasico.Dia3
{
    partial class FormularioPrincipal
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.btnConsultar = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.lblNeto = new System.Windows.Forms.Label();
            this.txbSueldo = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.lblIess = new System.Windows.Forms.Label();
            this.btnDatosPersonales = new System.Windows.Forms.Button();
            this.btnAnimal = new System.Windows.Forms.Button();
            this.btnEjemploCampo = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnConsultar
            // 
            this.btnConsultar.Location = new System.Drawing.Point(176, 153);
            this.btnConsultar.Name = "btnConsultar";
            this.btnConsultar.Size = new System.Drawing.Size(75, 23);
            this.btnConsultar.TabIndex = 0;
            this.btnConsultar.Text = "neto a pagar";
            this.btnConsultar.UseVisualStyleBackColor = true;
            this.btnConsultar.Click += new System.EventHandler(this.btnConsultar_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(173, 29);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(43, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Sueldo:";
            // 
            // lblNeto
            // 
            this.lblNeto.AutoSize = true;
            this.lblNeto.Location = new System.Drawing.Point(177, 196);
            this.lblNeto.Name = "lblNeto";
            this.lblNeto.Size = new System.Drawing.Size(28, 13);
            this.lblNeto.TabIndex = 2;
            this.lblNeto.Text = "0.00";
            // 
            // txbSueldo
            // 
            this.txbSueldo.Location = new System.Drawing.Point(176, 57);
            this.txbSueldo.Name = "txbSueldo";
            this.txbSueldo.Size = new System.Drawing.Size(100, 20);
            this.txbSueldo.TabIndex = 3;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(176, 84);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(29, 13);
            this.label2.TabIndex = 4;
            this.label2.Text = "Iess:";
            // 
            // lblIess
            // 
            this.lblIess.AutoSize = true;
            this.lblIess.Location = new System.Drawing.Point(179, 114);
            this.lblIess.Name = "lblIess";
            this.lblIess.Size = new System.Drawing.Size(28, 13);
            this.lblIess.TabIndex = 5;
            this.lblIess.Text = "0.00";
            // 
            // btnDatosPersonales
            // 
            this.btnDatosPersonales.Location = new System.Drawing.Point(13, 259);
            this.btnDatosPersonales.Name = "btnDatosPersonales";
            this.btnDatosPersonales.Size = new System.Drawing.Size(75, 23);
            this.btnDatosPersonales.TabIndex = 6;
            this.btnDatosPersonales.Text = "Datos Personales";
            this.btnDatosPersonales.UseVisualStyleBackColor = true;
            this.btnDatosPersonales.Click += new System.EventHandler(this.btnDatosPersonales_Click);
            // 
            // btnAnimal
            // 
            this.btnAnimal.Location = new System.Drawing.Point(125, 259);
            this.btnAnimal.Name = "btnAnimal";
            this.btnAnimal.Size = new System.Drawing.Size(75, 23);
            this.btnAnimal.TabIndex = 7;
            this.btnAnimal.Text = "Animal";
            this.btnAnimal.UseVisualStyleBackColor = true;
            this.btnAnimal.Click += new System.EventHandler(this.btnAnimal_Click);
            // 
            // btnEjemploCampo
            // 
            this.btnEjemploCampo.Location = new System.Drawing.Point(206, 259);
            this.btnEjemploCampo.Name = "btnEjemploCampo";
            this.btnEjemploCampo.Size = new System.Drawing.Size(122, 23);
            this.btnEjemploCampo.TabIndex = 8;
            this.btnEjemploCampo.Text = "Ejemplo Campos";
            this.btnEjemploCampo.UseVisualStyleBackColor = true;
            this.btnEjemploCampo.Click += new System.EventHandler(this.btnEjemploCampo_Click);
            // 
            // FormularioPrincipal
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(574, 300);
            this.Controls.Add(this.btnEjemploCampo);
            this.Controls.Add(this.btnAnimal);
            this.Controls.Add(this.btnDatosPersonales);
            this.Controls.Add(this.lblIess);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txbSueldo);
            this.Controls.Add(this.lblNeto);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnConsultar);
            this.Name = "FormularioPrincipal";
            this.Text = "FormularioPrincipal";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnConsultar;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label lblNeto;
        private System.Windows.Forms.TextBox txbSueldo;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label lblIess;
        private System.Windows.Forms.Button btnDatosPersonales;
        private System.Windows.Forms.Button btnAnimal;
        private System.Windows.Forms.Button btnEjemploCampo;
    }
}