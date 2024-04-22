
namespace CSharpBasico.Dia1
{
    partial class pruebaBasica2
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
            this.tbxValor1 = new System.Windows.Forms.TextBox();
            this.btnSuma = new System.Windows.Forms.Button();
            this.lblSintesis = new System.Windows.Forms.Label();
            this.tbxValor2 = new System.Windows.Forms.TextBox();
            this.btnDividir = new System.Windows.Forms.Button();
            this.btnMultiplicate = new System.Windows.Forms.Button();
            this.btnResta = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // tbxValor1
            // 
            this.tbxValor1.Location = new System.Drawing.Point(89, 61);
            this.tbxValor1.Name = "tbxValor1";
            this.tbxValor1.Size = new System.Drawing.Size(100, 20);
            this.tbxValor1.TabIndex = 0;
            // 
            // btnSuma
            // 
            this.btnSuma.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSuma.Location = new System.Drawing.Point(89, 167);
            this.btnSuma.Name = "btnSuma";
            this.btnSuma.Size = new System.Drawing.Size(75, 40);
            this.btnSuma.TabIndex = 2;
            this.btnSuma.Text = "+";
            this.btnSuma.UseVisualStyleBackColor = true;
            this.btnSuma.Click += new System.EventHandler(this.btnSuma_Click);
            // 
            // lblSintesis
            // 
            this.lblSintesis.AutoSize = true;
            this.lblSintesis.Location = new System.Drawing.Point(289, 235);
            this.lblSintesis.Name = "lblSintesis";
            this.lblSintesis.Size = new System.Drawing.Size(0, 13);
            this.lblSintesis.TabIndex = 3;
            // 
            // tbxValor2
            // 
            this.tbxValor2.Location = new System.Drawing.Point(292, 61);
            this.tbxValor2.Name = "tbxValor2";
            this.tbxValor2.Size = new System.Drawing.Size(100, 20);
            this.tbxValor2.TabIndex = 4;
            // 
            // btnDividir
            // 
            this.btnDividir.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDividir.Location = new System.Drawing.Point(378, 167);
            this.btnDividir.Name = "btnDividir";
            this.btnDividir.Size = new System.Drawing.Size(75, 40);
            this.btnDividir.TabIndex = 5;
            this.btnDividir.Text = "/";
            this.btnDividir.UseVisualStyleBackColor = true;
            this.btnDividir.Click += new System.EventHandler(this.btnDividir_Click);
            // 
            // btnMultiplicate
            // 
            this.btnMultiplicate.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnMultiplicate.Location = new System.Drawing.Point(282, 167);
            this.btnMultiplicate.Name = "btnMultiplicate";
            this.btnMultiplicate.Size = new System.Drawing.Size(75, 40);
            this.btnMultiplicate.TabIndex = 6;
            this.btnMultiplicate.Text = "x";
            this.btnMultiplicate.UseVisualStyleBackColor = true;
            this.btnMultiplicate.Click += new System.EventHandler(this.btnMultiplicate_Click);
            // 
            // btnResta
            // 
            this.btnResta.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnResta.Location = new System.Drawing.Point(191, 167);
            this.btnResta.Name = "btnResta";
            this.btnResta.Size = new System.Drawing.Size(75, 40);
            this.btnResta.TabIndex = 7;
            this.btnResta.Text = "-";
            this.btnResta.UseVisualStyleBackColor = true;
            this.btnResta.Click += new System.EventHandler(this.btnResta_Click);
            // 
            // pruebaBasica2
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnResta);
            this.Controls.Add(this.btnMultiplicate);
            this.Controls.Add(this.btnDividir);
            this.Controls.Add(this.tbxValor2);
            this.Controls.Add(this.lblSintesis);
            this.Controls.Add(this.btnSuma);
            this.Controls.Add(this.tbxValor1);
            this.Name = "pruebaBasica2";
            this.Text = "fusionar";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox tbxValor1;
        private System.Windows.Forms.Button btnSuma;
        private System.Windows.Forms.Label lblSintesis;
        private System.Windows.Forms.TextBox tbxValor2;
        private System.Windows.Forms.Button btnDividir;
        private System.Windows.Forms.Button btnMultiplicate;
        private System.Windows.Forms.Button btnResta;
    }
}