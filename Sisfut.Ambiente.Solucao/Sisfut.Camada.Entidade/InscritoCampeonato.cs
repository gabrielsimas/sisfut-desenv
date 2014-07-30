// -----------------------------------------------------------------------
// <copyright file="InscritoCampeonato.cs" company="CS Services Consultoria em Sistemas">
// TODO: Update copyright text.
// </copyright>
// -----------------------------------------------------------------------

namespace Camada.Entidade
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Reflection;

    /// <summary>
    /// Entidade Clube Inscrito no Campeonato
    /// </summary>
    public class InscritoCampeonato
    {
        #region atributos
        private Nullable<long> id;
        private Clube clube;
        private Campeonato campeonato;
        #endregion
        
        #region Construtores
        public InscritoCampeonato()
        {

        }

        public InscritoCampeonato(Nullable<long> id, Clube clube, Campeonato campeonato)
        {
            this.id = id;
            this.clube = clube;
            this.campeonato = campeonato;
        }
        #endregion

        #region Propriedades
        public Nullable<long> Id
        {
            get
            {
                return this.id;
            }

            set
            {
                this.id = value;
            }
        }

        public Clube Clube
        {
            get
            {
                return this.clube;
            }

            set
            {
                this.clube = value;
            }
        }

        public Campeonato Campeonato
        {
            get
            {
                return this.campeonato;
            }

            set
            {
                this.campeonato = value;
            }
        }
        #endregion

        #region Classe Rica

        public override bool Equals(object obj)
        {
            if (obj is InscritoCampeonato)
            {
                InscritoCampeonato objeto = (InscritoCampeonato)obj;

                if (objeto.Id != null && this.id != null)
                {
                    return objeto.Id.Equals(this.id);
                }
            }

            return false;
        }

        public override string ToString()
        {
            FieldInfo[] atributos;
            atributos = GetType().GetFields(BindingFlags.NonPublic);
            return atributos.ToString();
        }

        public override int GetHashCode()
        {
            return this.id.HasValue ? this.id.GetHashCode() : 0;
        }

        #endregion
    }
}
