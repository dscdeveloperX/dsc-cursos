
namespace CSharpBasico.Dia7
{
    partial class FormularioDia7
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
            this.btnCall1 = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnCall1
            // 
            this.btnCall1.Location = new System.Drawing.Point(35, 32);
            this.btnCall1.Name = "btnCall1";
            this.btnCall1.Size = new System.Drawing.Size(75, 23);
            this.btnCall1.TabIndex = 0;
            this.btnCall1.Text = "call-1";
            this.btnCall1.UseVisualStyleBackColor = true;
            this.btnCall1.Click += new System.EventHandler(this.btnCall1_Click);
            // 
            // FormularioDia6
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnCall1);
            this.Name = "FormularioDia6";
            this.Text = "FormularioDia6";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnCall1;
    }
}