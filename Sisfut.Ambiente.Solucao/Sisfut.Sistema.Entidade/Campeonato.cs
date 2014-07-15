// -----------------------------------------------------------------------
// <copyright file="Campeonato.cs" company="CS Services Consultoria em Sistemas">
// TODO: Update copyright text.
// </copyright>
// -----------------------------------------------------------------------

namespace Sisfut.Sistema.Entidade
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Reflection;

    /// <summary>
    /// Entidade Campeonato
    /// </summary>
    public class Campeonato
    {
        #region Enum

        enum TipoCampeonato
        {
            PontosCorridos,
            Chaves,
            Grupos
        }

        enum TipoEliminatoria
        {
            Nenhum,
            OitavasQuartasSemiFinal,
            QuadrangularFinal,
            TriangularFinal
        }
        #endregion

        #region Atributos

        private Nullable<long> id;
        private String nomeCompleto;
        private String apelido;
        private DateTime dataInicio;
        private DateTime dataTermino;
        private TipoCampeonato tipo;
        private int nroParticipantes;
        private int nroChaves;
        private int nroGrupos;
        private int nroTurnos;
        private int pontosVitoria;
        private int pontosEmpate;
        private int pontosDerrota;
        private Boolean rebaixamento;
        private int nroClubesRebaixados;
        private int inicioPosicaoRebaixamento;
        private TipoEliminatoria tipoEliminatoria;
        private IList<FaseCampeonato> fases;
        private IList<InscritoCampeonato> clubesInscritos;
        private Confederacao confederacao;     
        
        #endregion

        #region Construtores

        public Campeonato()
        {

        }

        public Campeonato(Nullable<long> id, string nomeCompleto, String apelido, DateTime dataInicio, DateTime dataTermino, TipoCampeonato tipoCampeonato, int nroParticipantes, int nroChaves, int nroGrupos, int nroTurnos, int pontosVitoria, int pontosDerrota, int pontosEmpate,TipoEliminatoria tipoEliminatoria, IList<FaseCampeonato> fases, IList<InscritoCampeonato> clubesParticipantes, Confederacao confederacao, int clubesRebaixados, int inicioPosRebaixamento, Boolean temRebaixamento)
        {
            this.id = id;
            this.nomeCompleto = nomeCompleto;
            this.apelido = apelido;
            this.dataInicio = dataInicio;
            this.dataTermino = dataTermino;
            this.tipo = tipoCampeonato;
            this.nroParticipantes = nroParticipantes;
            this.nroChaves = nroChaves;
            this.nroGrupos = nroGrupos;
            this.nroTurnos = nroTurnos;
            this.pontosVitoria = pontosVitoria;
            this.pontosEmpate = pontosEmpate;
            this.pontosDerrota = pontosDerrota;
            this.tipoEliminatoria = tipoEliminatoria;
            this.fases = fases;
            this.clubesInscritos = clubesParticipantes;
            this.confederacao = confederacao;
            this.nroClubesRebaixados = clubesRebaixados;
            this.inicioPosicaoRebaixamento = inicioPosRebaixamento;
            this.rebaixamento = temRebaixamento;
        }

        #endregion

        #region Propriedades

        public virtual Nullable<long> Id {
            get
            {
                return this.id;
            }

            set
            {
                this.id = value;
            }
        }

        public virtual String NomeCompleto {
            get
            {
                return this.nomeCompleto;
            }

            set
            {
                this.nomeCompleto = value;
            }
        }
        public virtual String Apelido {
            get
            {
                return this.apelido;
            }

            set
            {
                this.apelido = value;
            }
        }

        public virtual DateTime DataInicio {
            get
            {
                return this.dataInicio;
            }

            set
            {
                this.dataInicio = value;
            }
        }

        public virtual DateTime DataTermino {
            get
            {
                return this.dataTermino;
            }

            set
            {
                this.dataTermino = value;
            }
        }

        public virtual TipoCampeonato Tipo {
            get
            {
                return this.tipo;
            }

            set
            {
                this.tipo = value;
            }
        }

        public virtual int NroParticipantes {
            get
            {
                return this.nroParticipantes;
            }

            set
            {
                this.nroParticipantes = value;
            }
        }

        public virtual int NroChaves {

            get
            {
                return this.nroChaves;
            }

            set
            {
                this.nroChaves = value;
            }

        }

        public virtual int NroTurnos {
            get
            {
                return this.nroTurnos;
            }

            set
            {
                this.nroTurnos = value;
            }
        }

        public virtual int PontosVitoria {
            get
            {
                return this.pontosVitoria;
            }

            set
            {
                this.pontosVitoria = value;
            }
        }

        public virtual int PontosEmpate {
            get
            {
                return this.pontosEmpate;
            }

            set
            {
                this.pontosEmpate = value;
            }
        }

        public virtual int PontosDerrota {
            get
            {
                return this.pontosDerrota;
            }

            set
            {
                this.pontosDerrota = value;
            }
        }

        public virtual TipoEliminatoria TipoEliminatoria {
            get
            {
                return this.tipoEliminatoria;
            }

            set
            {
                this.tipoEliminatoria = value;
            }
        }

        public virtual IList<FaseCampeonato> Fases {
            get
            {
                return this.fases;
            }

            set
            {
                this.fases = value;
            }
        }

        public virtual IList<InscritoCampeonato> Clubes {
            get
            {
                return this.clubesInscritos;
            }

            set
            {
                this.clubesInscritos = value;
            }
        }

        public virtual Confederacao Confederacao {
            get
            {
                return this.confederacao;
            }

            set
            {
                this.confederacao = value;
            }
        }

        //this.nroClubesRebaixados = clubesRebaixados;
        public int NroClubesRebaixados {
            get
            {
                return this.nroClubesRebaixados;
            }

            set
            {
                this.nroClubesRebaixados = value;
            }
        }

        public int InicioPosicaoRebaixamento
        {
            get
            {
                return this.inicioPosicaoRebaixamento;
            }

            set
            {
                this.inicioPosicaoRebaixamento = value;
            }
        }

        public Boolean Rebaixamento
        {
            get
            {
                return this.rebaixamento;
            }

            set
            {
                this.rebaixamento = value;
            }
        }
                
        #endregion

        #region Classe Rica

        public override bool Equals(object obj)
        {
            if (obj is Campeonato)
            {
                Campeonato objeto = (Campeonato)obj;

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
