
namespace CSharpBasico.Dia8
{
    partial class FormDia8
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
            this.btnSelect1 = new System.Windows.Forms.Button();
            this.tbxTipo = new System.Windows.Forms.TextBox();
            this.GridPersona = new System.Windows.Forms.DataGridView();
            this.tbxSueldo = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.GridPersona)).BeginInit();
            this.SuspendLayout();
            // 
            // btnSelect1
            // 
            this.btnSelect1.Location = new System.Drawing.Point(59, 38);
            this.btnSelect1.Name = "btnSelect1";
            this.btnSelect1.Size = new System.Drawing.Size(75, 23);
            this.btnSelect1.TabIndex = 0;
            this.btnSelect1.Text = "Select-1";
            this.btnSelect1.UseVisualStyleBackColor = true;
            this.btnSelect1.Click += new System.EventHandler(this.btnSelect1_Click);
            // 
            // tbxTipo
            // 
            this.tbxTipo.Location = new System.Drawing.Point(217, 38);
            this.tbxTipo.Name = "tbxTipo";
            this.tbxTipo.Size = new System.Drawing.Size(100, 20);
            this.tbxTipo.TabIndex = 1;
            // 
            // GridPersona
            // 
            this.GridPersona.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.GridPersona.Location = new System.Drawing.Point(50, 279);
            this.GridPersona.Name = "GridPersona";
            this.GridPersona.Size = new System.Drawing.Size(647, 150);
            this.GridPersona.TabIndex = 2;
            // 
            // tbxSueldo
            // 
            this.tbxSueldo.Location = new System.Drawing.Point(383, 38);
            this.tbxSueldo.Name = "tbxSueldo";
            this.tbxSueldo.Size = new System.Drawing.Size(100, 20);
            this.tbxSueldo.TabIndex = 3;
            // 
            // FormDia8
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.tbxSueldo);
            this.Controls.Add(this.GridPersona);
            this.Controls.Add(this.tbxTipo);
            this.Controls.Add(this.btnSelect1);
            this.Name = "FormDia8";
            this.Text = "FormDia8";
            ((System.ComponentModel.ISupportInitialize)(this.GridPersona)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnSelect1;
        private System.Windows.Forms.TextBox tbxTipo;
        private System.Windows.Forms.DataGridView GridPersona;
        private System.Windows.Forms.TextBox tbxSueldo;
    }
}